#!/usr/bin/env bash

FROM_VERSION=$1
TO_VERSION=$2

FROM=owncloud-$FROM_VERSION.tar.bz2
TO=owncloud-$TO_VERSION.tar.bz2

rm -rf /drone/src/owncloud-*.tar.bz2

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

wget -qO /drone/src/owncloud-debug.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-debug.tar.bz2
# wget -qO /drone/src/owncloud-master.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-master.tar.bz2
# wget -qO /drone/src/owncloud-705290a-all.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-705290a-all.tar.bz2
# wget -qO /drone/src/owncloud-214dd63.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-214dd63.tar.bz2
# wget -qO /drone/src/owncloud-705290a.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-705290a.tar.bz2
# wget -qO /drone/src/owncloud-214dd63.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-214dd63.tar.bz2
# wget -qO /drone/src/owncloud-997256c.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-997256c.tar.bz2
# wget -qO /drone/src/owncloud-03aad46.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-03aad46.tar.bz2
# wget -qO /drone/src/owncloud-3ff78c2.tar.bz2 https://jankaritech.ocloud.de/index.php/s/akkL82ne9CYK6X2/download\?path=/\&files=owncloud-3ff78c2.tar.bz2
# wget -qO /drone/src/owncloud-master.tar.bz2 https://jankaritech.ocloud.de/index.php/s/2dFqEUMCnbF6VfC/download
# wget -qO /drone/src/owncloud-daily-local.tar.bz2 https://jankaritech.ocloud.de/index.php/s/WzIC6hCP6IlMlZu/download
# wget -qO /drone/src/owncloud-daily.tar.bz2 https://download.owncloud.com/server/daily/owncloud-daily-master-qa.tar.bz2

# if [ ! -f $TO ]; then
#   # Look in download.owncloud.com/server for the tarball
#   # All official tarballs will be found there
#   wget -nv http://download.owncloud.com/server/daily/$TO || true
#   if [ ! -f $TO ]; then
#     wget -nv http://download.owncloud.com/server/testing/$TO || true
#   fi
#   if [ ! -f $TO ]; then
#     wget -nv http://download.owncloud.com/server/stable/$TO || true
#   fi
# else
#   echo "Reuse existing $TO"
# fi

if [ ! -f $FROM ]; then
  echo "Could not download $FROM"
  exit 1
fi

# if [ ! -f $TO ]; then
#   echo "Could not download $TO"
#   exit 1
# fi
