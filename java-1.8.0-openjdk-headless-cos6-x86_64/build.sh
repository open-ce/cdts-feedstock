#!/bin/bash
# *****************************************************************
# (C) Copyright IBM Corp. 2020, 2021. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# *****************************************************************

source "${SRC_DIR}/build_cdt_package.sh"

SYSROOT_DIR="${PREFIX}"/x86_64-conda_cos6-linux-gnu/sysroot/usr

pre_build

# START OF INSERTED BUILD APPENDS

jvm_slug=$(compgen -G "${SYSROOT_DIR}/lib/jvm/java-1.8.0-openjdk-*")
jvm_slug=$(basename ${jvm_slug})

# Fix broken links
pushd ${SYSROOT_DIR}/lib/jvm-exports > /dev/null 2>&1
rm -rf jre-1.8.0-openjdk.x86_64
ln -s ${SYSROOT_DIR}/lib/jvm-exports/${jvm_slug} ${SYSROOT_DIR}/lib/jvm-exports/jre-1.8.0-openjdk.x86_64
popd > /dev/null 2>&1

pushd ${SYSROOT_DIR}/lib/jvm/${jvm_slug}/jre/lib > /dev/null 2>&1
rm -rf tzdb.dat
ln -s ${SYSROOT_DIR}/share/javazi-1.8/tzdb.dat ${SYSROOT_DIR}/lib/jvm/${jvm_slug}/jre/lib
popd > /dev/null 2>&1


# END OF INSERTED BUILD APPENDS
post_build

