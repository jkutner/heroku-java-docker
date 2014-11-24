#!/usr/bin/env bash

herokuDir=${1-$(pwd)}

JVM_COMMON_BUILDPACK=http://lang-jvm.s3.amazonaws.com/jvm-buildpack-common-v8.tar.gz
mkdir -p ${herokuDir}/jvm-common
curl --silent --location $JVM_COMMON_BUILDPACK | tar xzm -C ${herokuDir}/jvm-common
. ${herokuDir}/jvm-common/bin/util
. ${herokuDir}/jvm-common/bin/java

if [ -f $herokuDir/system.properties ]; then
  javaVersion=$(detect_java_version ${herokuDir})
  echo -n " ---> Installing OpenJDK ${javaVersion}..."
  install_java ${herokuDir}/jdk${javaVersion} ${javaVersion}
  echo " done"
else
  for javaVersion in "1.6" "1.7" "1.8"; do
    mkdir -p ${herokuDir}/jdk${javaVersion}
    echo -n " ---> Installing OpenJDK ${javaVersion}..."
    install_java ${herokuDir}/jdk${javaVersion} ${javaVersion}
    echo " done"
  done
fi
