#!/usr/bin/env zsh

user_settings_path="${HOME}/Library/Application Support/Sublime Text/Packages/User"
git_settings_path="${HOME}/dotfiles/SublimeText/Packages/User"

mkdir -p "${git_settings_path}"

cp -a "${user_settings_path}/." "${git_settings_path}/"