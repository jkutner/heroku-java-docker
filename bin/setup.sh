#!/usr/bin/env bash

BUILD_DIR=${1-$(pwd)}

JVM_COMMON_BUILDPACK=http://lang-jvm.s3.amazonaws.com/jvm-buildpack-common-v8.tar.gz
mkdir -p /tmp/jvm-common
curl --silent --location $JVM_COMMON_BUILDPACK | tar xzm -C /tmp/jvm-common
. /tmp/jvm-common/bin/util
. /tmp/jvm-common/bin/java

# install JDK
javaVersion=${2:-$(detect_java_version ${BUILD_DIR})}
echo -n " ---> Installing OpenJDK ${javaVersion}..."
install_java ${BUILD_DIR} ${javaVersion}
echo " done"
