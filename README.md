# Dev Container Features

## neovim
## kafka_cli

## Example usage

Here's an example usage with useful other features.
It also mounts your neovim config into the container.

```json
{
  ...
  "features": {
    "ghcr.io/devcontainers/features/github-cli:1": {},

    "ghcr.io/jungaretti/features/ripgrep:1": {},
    "ghcr.io/braun-daniel/devcontainer-features/fzf:1": {},

    "ghcr.io/caspersg/devcontainer_features/neovim:1": {},

    "ghcr.io/caspersg/devcontainer_features/kafka_cli:1": {}
  },
  "mounts": [
    "source=${localEnv:HOME}/.config/nvim,target=/home/vscode/.config/nvim,type=bind,consistency=cached"
  ],
  ...
```
