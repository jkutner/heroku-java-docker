#!/usr/bin/env bash

herokuDir=/opt/heroku
appDir=`pwd`

. ${herokuDir}/jvm-common/bin/util
. ${herokuDir}/jvm-common/bin/java

javaVersion=$(detect_java_version $appDir)
ln -s ${herokuDir}/jdk${javaVersion:="1.8"}/.jdk ${herokuDir}/.jdk
ln -s ${herokuDir}/jdk${javaVersion}/.profile.d ${herokuDir}/.profile.d

echo "Using OpenJDK $javaVersion"

for FILE in $(ls ${herokuDir}/.profile.d); do
  source ${herokuDir}/.profile.d/$FILE
done

foreman start $@
