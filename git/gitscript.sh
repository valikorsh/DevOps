#!/bin/bash
echo "input username"
read  user
echo "input repo"
read repo
#repo=
echo `curl -i https://github.com/$user/$repo`
