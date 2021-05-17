#!/bin/sh

npm_package_version=$(coffee -e "process.stdout.write require('./package').version")
perl -pi -e "s/v\d\.\d\.\d/v$npm_package_version/g if (m/releases/)" README.md
git add README.md
