#!/usr/bin/env zsh

user_settings_path="${HOME}/Library/Application Support/Sublime Text/Packages/User"
git_settings_path="${HOME}/dotfiles/SublimeText/Packages/User"

cp -a "${git_settings_path}/." "${user_settings_path}/"