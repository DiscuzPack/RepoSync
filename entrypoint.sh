#!/bin/sh

# Input SSH Key
mkdir -p /root/.ssh
echo "${INPUT_PRIVATE_KEY}" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
mkdir -p /root/repo
cd /root/repo

# Git Debug Mode
export GIT_TRACE=2
export GIT_CURL_VERBOSE=2
export GIT_TRACE_PERFORMANCE=2
export GIT_TRACE_SETUP=2
export GIT_TRACE_SHALLOW=2

# Show Running Command
set -x

# Pull Cache Repo
git clone git@github.com:DiscuzPack/DiscuzX.git --verbose

# Add Upstream Repo Configure
cd DiscuzX
git remote add upstream https://gitee.com/Discuz/DiscuzX.git

# Merge & Re-Push Mirror Repo
git fetch -p upstream
git checkout -b master origin/master
git pull upstream master --force --verbose
git push origin master --force --verbose
git checkout -b v3.5 origin/v3.5
git pull upstream v3.5 --force --verbose
git push origin v3.5 --force --verbose
git push origin --tags

# TODO: Success Callback

# Skip original code
exit $?
