#!/bin/sh
rm singlefile-extension-firefox.zip singlefile-extension-chromium.zip
zip -r singlefile-extension-firefox.zip manifest.json extension lib _locales
cp manifest.json manifest.copy.json
jq "del(.applications,.sidebar_action,.permissions[0],.options_ui.browser_style)" manifest.copy.json > manifest.json
zip -r singlefile-extension-chromium.zip manifest.json extension lib _locales
mv manifest.copy.json manifest.json