Dotfiles
========

Personal dotfiles and machine setup for macOS. Cloned to `~/System/dotfiles`
(the scripts assume this exact path).

What's tracked
--------------

- Shell: `zshrc` (+ oh-my-zsh, cloned separately), `bashrc`
- Git: `gitconfig`
- Vim family: `vimrc`, `vim/`, `xvimrc`, `ideavimrc`, `vscodevimrc`
- Cursor: `cursor/settings.json` + `cursor/extensions.txt`
- IntelliJ IDEA: `intellij/` (options, keymaps, codestyles, colors,
  inspection, consoles, disabled_plugins.txt, idea.vmoptions, plugins.txt)
- iTerm2: `iterm2/` (iTerm2 loads/saves its prefs there directly)
- sketchybar: `sketchybar/` (linked to `~/.config/sketchybar`)
- Homebrew: `Brewfile`
- Installers: `install/`

Secrets do NOT live in this repo. Machine-local/private exports go in
`~/.private` (plain file, sourced by zshrc, never committed).

Prerequisites
-------------

- macOS with `git` and `zsh` (both ship with the system; running any `git`
  command triggers the Xcode Command Line Tools install if needed)
- `curl` (ships with macOS)
- Everything else (Homebrew included) is installed by the scripts below.

Setup sequence
--------------

``` bash
git clone <this-repo> ~/System/dotfiles
cd ~/System/dotfiles

# 1. Symlink all dotfiles into place.
#    Also: backs up anything it replaces to ~/dotfiles_old/<timestamp>/,
#    clones oh-my-zsh + zsh-syntax-highlighting, links IntelliJ/Cursor
#    settings, points iTerm2 at iterm2/, sets zsh as default shell.
./makesymlinks.sh

# 2. Install all toolchains (each step is idempotent, safe to re-run):
#    brew.sh             Homebrew + Brewfile + sketchybar service
#    sdkman-jvm.sh       SDKMAN, Corretto 21 + Temurin 21 (default),
#                        sbt, Scala latest (default) + 2.13
#    volta-node.sh       Volta, Node LTS, npm, bun
#    conda-python.sh     Miniconda + `dev` env (python 3.12)
#    rbenv-ruby.sh       rbenv + latest stable Ruby
#    golang.sh           recent Go via brew
#    cursor-extensions.sh  Cursor extensions from cursor/extensions.txt
#                          (needs the `cursor` CLI: Cursor -> Cmd+Shift+P
#                          -> "Install 'cursor' command")
./install/all.sh

# 3. Open a new terminal (zsh picks up everything).
```

Individual installers can be run standalone, e.g. `./install/brew.sh`
after editing the Brewfile.

Manual follow-ups on a new machine
----------------------------------

- Create `~/.private` with private exports (API keys etc.)
- Open JetBrains Toolbox (installed via Brewfile) and install IntelliJ IDEA;
  plugins are listed in `intellij/plugins.txt` (or use JetBrains Settings Sync)
- Re-run `./makesymlinks.sh` after IDEA's first launch to link its settings

Maintenance
-----------

- `brew bundle dump --describe --file=Brewfile --force` — refresh Brewfile
- `cursor/update-extensions.sh` — refresh the Cursor extensions list
- `./makesymlinks.sh` — idempotent; re-run any time (e.g. after an IDEA
  version upgrade, it links the newest `IntelliJIdea*` config dir)

<!-- dummy edit test -->
