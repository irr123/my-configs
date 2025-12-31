# Just a place where I synchronizing my cfgs ower multiple machines

Good font you may be found here https://github.com/ryanoasis/nerd-fonts/releases
 or `brew install font-jetbrains-mono`

VIM setup working with 8+ version and neovim

Repo-related things:
- Installation `git clone --depth 1 --recurse-submodules -j8 https://github.com/c1rno/my-configs.git`
  (or, for old git use `--recursive`)
- Update: `git pull; git submodule foreach "(git checkout master; git pull)&"`

My unrelated notes:
- useful for win https://christitus.com/windows-tool/
  - same for mac https://github.com/tw93/Mole
- do not forget `brew analytics off`
- for docker do not forget enable `build_kit`
- if you use screen on Mac, install it from brew, default not supported utf8
- `ssh-keygen -o -a 100 -t ed25519 -C your_email@example.com` (prefer)
- `docker system prune -a --volumes`
- [host.docker.internal](https://github.com/bufferings/docker-access-host/blob/master/docker-entrypoint.sh)
- `xcode-select --install`
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

  rg --no-heading --vimgrep --hidden "$@"
  ```
- `sudo npm update -g @google/gemini-cli` -> `~/.gemini/settings.json`
- `sudo npm update -g anthropic-ai/claude-code`
