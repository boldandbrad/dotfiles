require('neo-tree').setup({
    buffers = {
        follow_current_file = {
            enabled = true,
        },
    },
    filesystem = {
        filtered_items = {
            always_show = {
                ".github"
            }
        },
        follow_current_file = {
            enabled = true,
        }
    },
    window = {
        position = "right",
        width = 32,
    },
})
