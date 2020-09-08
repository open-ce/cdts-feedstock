#!/bin/bash
# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************

source "${SRC_DIR}/build_cdt_package.sh"

SYSROOT_DIR="${PREFIX}"/powerpc64le-conda_cos7-linux-gnu/sysroot/usr

pre_build

# START OF INSERTED BUILD APPENDS

jvm_slug=$(compgen -G "${SYSROOT_DIR}/lib/jvm/java-1.8.0-openjdk-*")
jvm_slug=$(basename ${jvm_slug})

# Fix broken links
pushd ${SYSROOT_DIR}/lib/jvm/${jvm_slug}/jre/lib > /dev/null 2>&1
rm -rf tzdb.dat
ln -s ${SYSROOT_DIR}/share/javazi-1.8/tzdb.dat ${SYSROOT_DIR}/lib/jvm/${jvm_slug}/jre/lib
popd > /dev/null 2>&1


# END OF INSERTED BUILD APPENDS

post_build

