# boldandbrad/dotfiles - Terminal.app Profiles

This directory contains configuration profiles for macOS's native Terminal app.

> [!NOTE]
> Files beginning with `Catppuccin` are modified versions of profiles found in
> [catppuccin/Terminal.app](https://github.com/catppuccin/Terminal.app). In
> particular, they have been modified to use `18pt AnonymicePro Nerd Font` and
> to set a default window size of `96x24`.

## Usage

### Import

1. Import a profile:

   ```zsh
   open -a Terminal path/to/profile.terminal
   ```

   > If macOS prevents you from opening the profile this way due to security
   > precautions, you may need to import it manually in the Terminal.app
   > settings.

1. Next, set it as the default profile in Terminal.app settings.

### Export

Any manual modifications to the profile will need to be re-exported to this
directory from Terminal.app settings.
