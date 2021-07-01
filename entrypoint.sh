#!/bin/sh

# Show Running Command
set -x

# Input SSH Key
mkdir -p /root/.ssh
echo "${INPUT_PRIVATE_KEY}" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

# Git Debug Mode
GIT_TRACE=2
GIT_CURL_VERBOSE=2
GIT_TRACE_PERFORMANCE=2
GIT_TRACE_PACK_ACCESS=2
GIT_TRACE_PACKET=2
GIT_TRACE_PACKFILE=2
GIT_TRACE_SETUP=2
GIT_TRACE_SHALLOW=2

# Pull Upstream Repo
mkdir -p /root/repo/
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