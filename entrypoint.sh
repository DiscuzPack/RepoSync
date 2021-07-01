#!/bin/sh

# Input SSH Key
mkdir -p /root/.ssh
echo "${INPUT_PRIVATE_KEY}" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa

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