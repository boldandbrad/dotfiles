// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  // prefer default configs except
  config: {
    fontSize: 14,
    fontFamily: '"Fira Code", monospace',
    copyOnSelect: true,
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  plugins: [
    "hyper-font-ligatures",
    "hyper-github-dark-dimmed",
    "hyper-transparent-dynamic",
    "hyperterm-paste",
    "hyperterm-close-on-left",
    "hyper-quit",
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  // keymap overrides
  keymaps: {
    'window:reload': 'command+r',
    'window:reloadFull': 'command+shift+r'
  },
};
