#!/bin/bash

MANIFESTS=`dirname $0`/../*.pp
for manifest in `ls $MANIFESTS`
do
	puppet apply $manifest
done
