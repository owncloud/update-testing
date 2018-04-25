#!/usr/bin/env bash

FROM_VERSION=$1
TO_VERSION=$2

FROM=owncloud-$FROM_VERSION.tar.bz2
TO=owncloud-$TO_VERSION.tar.bz2


if [ ! -f $FROM ]; then
  wget -nv http://download.owncloud.org/community/$FROM || true
  wget -nv http://download.owncloud.org/community/testing/$FROM || true
else
  echo "Reuse existing $FROM"
fi

if [ ! -f $TO ]; then
  wget -nv http://download.owncloud.org/community/$TO || true
  wget -nv http://download.owncloud.org/community/testing/$TO || true
else
  echo "Reuse existing $TO"
fi

if [ ! -f $FROM ]; then
  echo "Could not download $FROM"
  exit 1
fi

if [ ! -f $TO ]; then
  echo "Could not download $TO"
  exit 1
fi
