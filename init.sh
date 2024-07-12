#!/bin/bash

mkdir -p ~/.config/nvim/lua/config
mkdir -p ~/.config/nvim/lua/plugins
cp ./init.lua ~/.config/nvim/init.lua
cp -r ./lua/* ~/.config/nvim/lua/
