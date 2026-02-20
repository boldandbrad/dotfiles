----------------------------------------------------------------
-- nvim custom statusline                                     --
----------------------------------------------------------------

local M = {}

local NONE = "NONE"
local palette = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

-- TODO: use catppuccin palette if available, otherwise fallback to basic colors
-- local palette = require("catppuccin.palettes").get_palette "mocha"

-- Helper to issue highlight commands
local function hi(group, opts)
  local cmd = { "highlight!", group }
  if opts.guibg then
    table.insert(cmd, "guibg=" .. opts.guibg)
  end
  if opts.guifg then
    table.insert(cmd, "guifg=" .. opts.guifg)
  end
  if opts.gui then
    table.insert(cmd, "gui=" .. opts.gui)
  end
  vim.cmd(table.concat(cmd, " "))
end

-- mode based highlight groups
hi("StatusBasic", { guibg = NONE, guifg = palette.text })
hi("StatusPrimaryNrm", { guibg = palette.blue, guifg = palette.surface0, gui = "bold" })
hi("StatusPrimaryIns", { guibg = palette.green, guifg = palette.surface0, gui = "bold" })
hi("StatusPrimaryVis", { guibg = palette.mauve, guifg = palette.surface0, gui = "bold" })
hi("StatusPrimaryCmd", { guibg = palette.peach, guifg = palette.surface0, gui = "bold" })
hi("StatusPrimaryOth", { guibg = palette.text, guifg = palette.surface0, gui = "bold" })
hi("StatusSecondaryNrm", { guibg = palette.surface0, guifg = palette.blue })
hi("StatusSecondaryIns", { guibg = palette.surface0, guifg = palette.green })
hi("StatusSecondaryVis", { guibg = palette.surface0, guifg = palette.mauve })
hi("StatusSecondaryOth", { guibg = palette.surface0, guifg = palette.text })
hi("StatusSecondaryCmd", { guibg = palette.surface0, guifg = palette.peach })

-- git highlight groups
hi("StatusDiffAdd", { guibg = palette.surface0, guifg = palette.green })
hi("StatusDiffChange", { guibg = palette.surface0, guifg = palette.yellow })
hi("StatusDiffDelete", { guibg = palette.surface0, guifg = palette.red })

-- diagnostic highlight groups
hi("StatusErrorIcon", { guibg = NONE, guifg = palette.red })
hi("StatusWarnIcon", { guibg = NONE, guifg = palette.yellow })
hi("StatusInfoIcon", { guibg = NONE, guifg = palette.blue })
hi("StatusHintIcon", { guibg = NONE, guifg = palette.green })

local fn = vim.fn

-- Git repo/branch with caching - uses gitsigns buffer variables for performance
local function get_git_branch()
  local branch = vim.b.gitsigns_head
  if not branch or branch == "" then
    return ""
  end

  -- Get repo name from gitsigns status dict if available
  local gs = vim.b.gitsigns_status_dict
  if gs and gs.root then
    local repo_name = vim.fn.fnamemodify(gs.root, ":t")
    return repo_name .. " | " .. branch
  end

  return branch
end

local function build_git_diff()
  local gs = vim.b.gitsigns_status_dict or {}
  local added = gs.added or 0
  local changed = gs.changed or 0
  local removed = gs.removed or 0

  local diff_str = ""
  if added > 0 then
    diff_str = diff_str .. "%#StatusDiffAdd#+" .. added .. " "
  end
  if changed > 0 then
    diff_str = diff_str .. "%#StatusDiffChange#~" .. changed .. " "
  end
  if removed > 0 then
    diff_str = diff_str .. "%#StatusDiffDelete#-" .. removed .. " "
  end
  return diff_str
end

-- Diagnostics symbols
local function get_diagnostics()
  if not vim.diagnostic then
    return ""
  end
  local d = vim.diagnostic.get(0)
  local e, w, i, h = 0, 0, 0, 0
  for _, v in ipairs(d) do
    if v.severity == vim.diagnostic.severity.ERROR then
      e = e + 1
    elseif v.severity == vim.diagnostic.severity.WARN then
      w = w + 1
    elseif v.severity == vim.diagnostic.severity.INFO then
      i = i + 1
    elseif v.severity == vim.diagnostic.severity.HINT then
      h = h + 1
    end
  end

  local s = ""
  if e > 0 then
    s = s .. "%#StatusErrorIcon#E:" .. e .. " "
  end
  if w > 0 then
    s = s .. "%#StatusWarnIcon#W:" .. w .. " "
  end
  if i > 0 then
    s = s .. "%#StatusInfoIcon#I:" .. i .. " "
  end
  if h > 0 then
    s = s .. "%#StatusHintIcon#H:" .. h .. " "
  end
  return s
end

-- Word count & reading time
local function word_reading()
  local ft = vim.bo.filetype
  if ft:match("md") or ft:match("markdown") or ft == "text" then
    local w = fn.wordcount().words or 0
    return w .. "w " .. math.ceil(w / 200) .. "m"
  end
  return ""
end

-- Mode icons
local mode_icons = {
  n = "NORMAL",
  c = "COMMAND",
  t = "TERMINAL",
  i = "INSERT",
  R = "REPLACE",
  V = "V-LINE",
  [""] = "V-BLOCK", -- Visual Block
  r = "R-PENDING",
  v = "VISUAL",
}

-- 4) Build statusline
function M.build()
  local st = ""

  -- Highlights by mode
  local m = fn.mode()
  local p_style = "%#StatusPrimaryOth#"
  local s_style = "%#StatusSecondaryOth#"
  if m == "n" then
    p_style = "%#StatusPrimaryNrm#"
    s_style = "%#StatusSecondaryNrm#"
  elseif m == "i" then
    p_style = "%#StatusPrimaryIns#"
    s_style = "%#StatusSecondaryIns#"
  elseif m == "v" then
    p_style = "%#StatusPrimaryVis#"
    s_style = "%#StatusSecondaryVis#"
  elseif m == "c" then
    p_style = "%#StatusPrimaryCmd#"
    s_style = "%#StatusSecondaryCmd#"
  end

  -- A: mode
  st = st .. p_style .. " " .. (mode_icons[m] or m) .. " %#StatusBasic#"

  -- B: git
  local br = get_git_branch()
  if br ~= "" then
    st = st .. s_style .. " " .. br .. " "

    local git_diff = build_git_diff()
    if git_diff ~= "" then
      st = st .. "| " .. git_diff
    end
  end

  -- C: file
  local fnm = fn.expand("%:t")
  -- local fnm = fn.expand("%:.")
  if fnm ~= "" then
    st = st .. "%#StatusBasic# " .. fnm .. " " .. (vim.bo.modified and "[~] " or "")
  end

  local di = get_diagnostics()
  if di ~= "" then
    st = st .. "| " .. di
  end

  -- right align
  st = st .. "%="

  -- X: filetype, word/reading, encoding, format
  local ft = vim.bo.filetype
  if ft ~= "" then
    st = st .. "%#StatusBasic# " .. ft .. " "
  end

  local wr = word_reading()
  if wr ~= "" then
    st = st .. "%#StatusBasic# " .. wr .. " "
  end

  local en = vim.bo.fileencoding
  if en ~= "" then
    st = st .. "%#StatusBasic#" .. "| " .. en .. " "
  end

  local fmt = vim.bo.fileformat
  if fmt ~= "" then
    st = st .. "%#StatusBasic#" .. "| " .. fmt .. " "
  end

  -- Y: location
  st = st .. s_style .. " %l:%c "

  -- Z: percent
  st = st .. p_style .. " %p%% "

  return st
end

return M
