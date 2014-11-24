#!/bin/sh

runCmdName=${1:-"web"}

procType="$(grep "${runCmdName}:" Procfile | sed -E -e "s/${runCmdName}://g")"

for FILE in $(ls /opt/heroku/.profile.d); do
  . /opt/heroku/.profile.d/$FILE
done

eval "${procType}"
