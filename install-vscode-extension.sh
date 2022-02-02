#! /bin/sh

FILE=`cat ./vscode-extension.txt`

for line in $FILE; do
  code --install-extension $line
done
