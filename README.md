# Just a place where I synchronizing my cfgs over multiple machines

Good font you may be found here https://github.com/ryanoasis/nerd-fonts/releases
 or `brew install font-dejavu`

VIM setup working with 8+ version and neovim

Repo-related things:
- Installation `git clone --depth 1 --recurse-submodules -j8 https://github.com/irr123/my-configs.git`
  (or, for old git use `--recursive`)
- Update: `git pull; git submodule foreach "(git checkout master; git pull)&"`

Unrelated shortcats:
- `ssh-keygen -o -a 100 -t ed25519 -C your_email@example.com` (prefer)
- useful for win https://christitus.com/windows-tool/
  - same for mac https://github.com/tw93/Mole
- do not forget `brew analytics off`
- `sudo softwareupdate --install --all --restart` || `xcode-select --install`
- to start `vim`&`gopls` with custom params use
  ```
  #!/bin/sh
  export GOFLAGS="-tags=integration,unit,nowasm"
  export CGO_CFLAGS="$(go env CGO_CFLAGS) -I/usr/local/include -I/Users/<...>/vendor/github.com/pebbe/zmq4"
  export CGO_LDFLAGS="$(go env CGO_CFLAGS) -L/usr/local/lib"
  exec nvim "$@"
  ```
- `brew install ripgrep` and then put into chmoded $PATH/grep:
  ```
  #!/bin/sh
  rg --no-heading -uu -- "$@"
  ```
- [opencode.ai](https://opencode.ai/docs/config/) instead of codex, claude, etc
