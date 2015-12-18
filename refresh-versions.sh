#!/bin/sh

perl -pi -e "s/v\d\.\d\.\d/v$npm_package_version/g if (m/releases/)" README.md
git add README.md
