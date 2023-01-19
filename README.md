# Tmux Helper Pane
This is just a simple plugin to give you a helper pane on the bottom of your 
actual window (ideal to pair with nvim or vim)

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```tmux
set -g @plugin 'groteck/helper-pane'
```

Hit `<prefix> + I` to fetch the plugin and source it.

### Manual Installation

Clone the repo:

```shell
git clone https://github.com/groteck/helper-pane ~/clone/path
```

Add this line to the bottom of `.tmux.conf`:

```tmux
run-shell ~/clone/path/helper-pane.tmux
```

From the terminal, reload TMUX environment:

```shell
tmux source-file ~/.tmux.conf
```

## Usage

Just hit `C-t` and a pane will appear at the bottom if you hit `C-t` again
the pane will be hidden (move to another window).

### Change key binding

Add to your `tmux.conf`:

```tmux
unbind -n 'C-t' # this is to remove the existing key binding
bind t run-shell '~/.tmux/plugins/helper-pane/scripts/helper-pane.sh'
```
This example binds `<prefix> t` to display the pane.

## License

[MIT](/LICENSE.md)
