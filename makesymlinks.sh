#!/bin/bash
############################
# makesymlinks.sh
# Symlinks dotfiles from ~/System/dotfiles into place.
# Idempotent: correct existing symlinks are skipped, anything else
# is backed up to a timestamped directory before being replaced.
############################

dir=~/System/dotfiles
backupdir=~/dotfiles_old/$(date +%Y%m%d-%H%M%S)

# files/folders symlinked as ~/.<name>
files="gitconfig bashrc xvimrc ideavimrc vscodevimrc vimrc vim zshrc oh-my-zsh"

# folders symlinked as ~/.config/<name>
config_dirs="sketchybar"

# Create a symlink at $2 pointing to $1, backing up whatever was there.
link() {
    local target=$1 linkpath=$2
    if [ "$(readlink "$linkpath")" = "$target" ]; then
        echo "ok: $linkpath"
        return
    fi
    if [ -e "$linkpath" ] || [ -L "$linkpath" ]; then
        mkdir -p "$backupdir"
        echo "backing up $linkpath -> $backupdir/"
        mv "$linkpath" "$backupdir/"
    fi
    ln -s "$target" "$linkpath"
    echo "linked: $linkpath -> $target"
}

# oh-my-zsh is gitignored — clone it if missing (fresh machine)
if [ ! -d "$dir/oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$dir/oh-my-zsh"
fi
if [ ! -d "$dir/oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$dir/oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

for file in $files; do
    link "$dir/$file" ~/."$file"
done

mkdir -p ~/.config
for cfg in $config_dirs; do
    link "$dir/$cfg" ~/.config/"$cfg"
done

# Cursor settings
cursor_user="$HOME/Library/Application Support/Cursor/User"
if [ -d "$cursor_user" ]; then
    link "$dir/cursor/settings.json" "$cursor_user/settings.json"
fi

# IntelliJ IDEA settings (links into the newest IntelliJIdea* config dir)
idea_dir=$(ls -d "$HOME/Library/Application Support/JetBrains/"IntelliJIdea* 2>/dev/null | sort -V | tail -1)
if [ -n "$idea_dir" ]; then
    for item in options keymaps codestyles colors inspection consoles disabled_plugins.txt idea.vmoptions; do
        link "$dir/intellij/$item" "$idea_dir/$item"
    done
fi

# iTerm2: load/save prefs from the dotfiles folder (no symlink needed)
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$dir/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
echo "iTerm2 prefs folder set to $dir/iterm2"

# Set the default shell to zsh if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s "$(which zsh)"
fi
