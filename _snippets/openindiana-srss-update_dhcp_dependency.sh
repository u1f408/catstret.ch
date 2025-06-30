#!/bin/ksh

# set -x

if [ -z $1 ] || [ ! -d $1 ]; then
    echo "usage: $0 repodirectory"
    exit
fi

if [[ $1 != /* ]]; then
   repo=$(pwd)/$1
else
   repo=$1
fi

republish="republish$$"

mkdir ${republish}

for p in SUNWutr SUNWuto; {
(cd ${republish}
  pkgrecv -d . --raw -s $repo $p || exit 2
  for d in $(ls $p); {
      (cd $p/$d
        sed -i s#service/network/dhcp#service/network/dhcp/isc-dhcp# manifest
        pkgrepo -s $repo remove $p
        pkgsend publish -s $repo -d . manifest
      )
  }
);
}
rm -r ${republish}
