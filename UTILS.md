# CLI Utilities I Use

A simple reference list of tools I like to have installed. I install these manually depending on the environment.

## Core
- fzf — fuzzy finder
  - macOS (brew): `fzf`
  - Fedora (dnf): `fzf`
  - Debian/Ubuntu (apt): `fzf`

  ```
  # .zshrc
  source <(fzf --zsh)
  export FZF_CTRL_T_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
  export FZF_CTRL_R_OPTS="
    --bind 'ctrl-y:execute-silent(echo -n {2..} | copy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'"
  ```

- bat — `cat` with syntax highlighting
  - macOS (brew): `bat`
  - Fedora (dnf): `bat`
  - Debian/Ubuntu (apt): `bat`

- stow — symlink manager for dotfiles
  - macOS (brew): `stow`
  - Fedora (dnf): `stow`
  - Debian/Ubuntu (apt): `stow`

## Aliases
Preview and select Github branch
```
alias gcb="git branch | fzf --preview 'git show --color=always {-1}' \
                 --bind 'enter:become(git checkout {-1})' \
                 --height 40% --layout reverse"
```

## Notes
- Keep this file as a living list; add package names if they differ by distro.
- Prefer installing via native package manager for updates/security.
