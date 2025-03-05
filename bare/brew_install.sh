#!/bin/bash

brew install fish \
  fisher \
  neovim \
  tmux \
  rg \
  autojump \
  git-delta \
  jj \
  fzf \
  jq \
  kubelogin \
  node@20

brew link --overwrite node@20
