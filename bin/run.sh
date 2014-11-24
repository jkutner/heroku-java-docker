#!/usr/bin/env bash

runCmdName=${1:-"web"}
herokuDir=/opt/heroku

procType="$(grep "${runCmdName}:" Procfile | sed -E -e "s/${runCmdName}://g")"

. ${herokuDir}/jvm-common/bin/util
. ${herokuDir}/jvm-common/bin/java

javaVersion=$(detect_java_version ${herokuDir})
ln -s ${herokuDir}/jdk${javaVersion:="1.8"}/.jdk ${herokuDir}/.jdk
ln -s ${herokuDir}/jdk${javaVersion}/.profile.d ${herokuDir}/.profile.d

for FILE in $(ls ${herokuDir}/.profile.d); do
  . ${herokuDir}/.profile.d/$FILE
done

eval "${procType}"
