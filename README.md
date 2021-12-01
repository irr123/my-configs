# Just a place where I synchronizing my cfgs ower multiple machines

Good font you may be found here https://github.com/ryanoasis/nerd-fonts/releases
 or `brew install font-jetbrains-mono`

VIM setup working with 8+ version and neovim (https://github.com/macvim-dev/homebrew-macvim)

Repo-related things:
- Installation `git clone --depth 1 --recurse-submodules -j8 https://github.com/c1rno/my-configs.git`
  (or, for old git use `--recursive`)
- Iterm2 alternatives: (`brew cask install kitty`||`brew cask install alacritty`)
- How to build kitty from source for apple m1:
  ```
  LDFLAGS=-L/Users/<user>/Documents/homebrew/Cellar/gettext/0.21/lib \
  CPPFLAGS=-I/Users/<user>/Documents/homebrew/Cellar/gettext/0.21/include \
  CC="$(which clang)" \
  CFLAGS='-arch arm64 -target arm64-apple-macos11' \
  make app
  ```
- Lsp installs manually
- Manage (`git submodule deinit <path to plugin>` && `rm -rf <path to plugin>`) ||
  `git rm [--cached] <path to plugin>`
- Manage `git submodule add https://github.com/<plugin name> vimfiles\pack\plugins\start\<plugin name>`
- Update: `git submodule foreach "(git checkout master; git pull)&"`

My unrelated notes:
- do not forget `brew analytics off`
- for docker do not forget enable `build_kit`
- if you use screen on Mac, install it from brew, default not supported utf8
- from [another-doc](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54):
  `ssh-keygen -o -a 100 -t ed25519 -C your_email@example.com` (prefer)
- really usefull cmd `docker system prune -a --volumes`
- [tricky docker endpoint](https://github.com/bufferings/docker-access-host/blob/master/docker-entrypoint.sh)
- to start `vim` + `gopls` with custom build flags, just pass it over env:
  `GOFLAGS="-tags=windows" vim <file-name>.go`
- `brew install ripgrep` and then put into chmoded $PATH/grep:
  ```
  #!/usr/bin/env sh

  rg --vimgrep --no-heading "$@"
  ```
