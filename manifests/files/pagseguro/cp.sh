#!/bin/bash

origin=${FACTER_ROOT}/manifests/files/pagseguro/server/*
rsync -Cravzp --delete $origin /usr/local/pagseguro > /dev/null
