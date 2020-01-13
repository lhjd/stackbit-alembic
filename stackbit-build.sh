#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e1c65e448c832001a869ed0/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e1c65e448c832001a869ed0
curl -s -X POST https://api.stackbit.com/project/5e1c65e448c832001a869ed0/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e1c65e448c832001a869ed0/webhook/build/publish > /dev/null
