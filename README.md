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
- do not forget `brew analytics off`
- for docker do not forget enable `build_kit`
- if you use screen on Mac, install it from brew, default not supported utf8
- from [another-doc](https://medium.com/risan/upgrade-your-ssh-key-to-ed25519-c6e8d60d3c54):
  `ssh-keygen -o -a 100 -t ed25519 -C your_email@example.com` (prefer)
- really usefull cmd `docker system prune -a --volumes`
- [host.docker.internal](https://github.com/bufferings/docker-access-host/blob/master/docker-entrypoint.sh)
- mac inplace: `find . -type f -name "*.go" -exec sed -i '' 's|"node-balancer/|"go-streaming/|g' {} \;`
- to start `vim`&`gopls` with custom params use
  ```
  #!/usr/bin/env sh

  export GOFLAGS="-tags=integration,unit,nowasm"
  export CGO_CFLAGS="$(go env CGO_CFLAGS) -I/usr/local/include -I/Users/<...>/vendor/github.com/pebbe/zmq4"
  export CGO_LDFLAGS="$(go env CGO_CFLAGS) -L/usr/local/lib"

  /usr/local/bin/nvim "$@"
  ```
- `brew install ripgrep` and then put into chmoded $PATH/grep:
  ```
  #!/usr/bin/env sh

  rg --no-heading --vimgrep --hidden $@
  ```
- `sudo npm update -g @google/gemini-cli` -> `~/.gemini/settings.json`
- `sudo npm update -g anthropic-ai/claude-code`
