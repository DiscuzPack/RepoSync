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
export GIT_TRACE_PACK_ACCESS=2
export GIT_TRACE_PACKET=2
export GIT_TRACE_PACKFILE=2
export GIT_TRACE_SETUP=2
export GIT_TRACE_SHALLOW=2

# Show Running Command
set -x

# Pull Upstream Repo
git clone https://gitee.com/Discuz/DiscuzX.git --verbose

# Add Mirror Repo Configure
cd DiscuzX
git remote add dxct git@github.com:DiscuzPack/DiscuzX.git

# Push Mirror Repo
git checkout master
git push dxct master --force --verbose
git checkout v3.5
git push dxct v3.5 --force --verbose

# TODO: Success Callback

# Skip original code
exit $?