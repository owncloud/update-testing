#!/usr/bin/env bash

FROM_VERSION=$1
TO_VERSION=$2

FROM=owncloud-$FROM_VERSION.tar.bz2
TO=owncloud-$TO_VERSION.tar.bz2

if [ ! -f $FROM ]; then
  # Look in download.owncloud.com/server for the tarball
  # All official tarballs will be found there
  wget -nv http://download.owncloud.com/server/daily/$FROM || true
  if [ ! -f $FROM ]; then
    wget -nv http://download.owncloud.com/server/testing/$FROM || true
  fi
  if [ ! -f $FROM ]; then
    wget -nv http://download.owncloud.com/server/stable/$FROM || true
  fi
else
  echo "Reuse existing $FROM"
fi

if [ ! -f $TO ]; then
  # Look in download.owncloud.com/server for the tarball
  # All official tarballs will be found there
  wget -nv http://download.owncloud.com/server/daily/$TO || true
  if [ ! -f $TO ]; then
    wget -nv http://download.owncloud.com/server/testing/$TO || true
  fi
  if [ ! -f $TO ]; then
    wget -nv http://download.owncloud.com/server/stable/$TO || true
  fi
else
  echo "Reuse existing $TO"
fi

if [ ! -z "$3" ]; then
  VIA_VERSION=$3
  VIA=owncloud-$VIA_VERSION.tar.bz2
  if [ ! -f $VIA ]; then
    # Look in download.owncloud.com/server for the tarball
    # All official tarballs will be found there
    wget -nv http://download.owncloud.com/server/daily/$VIA || true
    if [ ! -f $VIA ]; then
      wget -nv http://download.owncloud.com/server/testing/$VIA || true
    fi
    if [ ! -f $VIA ]; then
      wget -nv http://download.owncloud.com/server/stable/$VIA || true
    fi
  else
    echo "Reuse existing $VIA"
  fi
  if [ ! -f $VIA ]; then
    echo "Could not download $VIA"
    exit 1
  fi
fi

if [ ! -f $FROM ]; then
  echo "Could not download $FROM"
  exit 1
fi

if [ ! -f $TO ]; then
  echo "Could not download $TO"
  exit 1
fi
