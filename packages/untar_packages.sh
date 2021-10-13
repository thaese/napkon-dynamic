#!/bin/sh

echo $HOME
mkdir -p $HOME/.fhir
mkdir -p $HOME/.fhir/packages
cd packages

for t in *.tgz ; do
  bn="$HOME/.fhir/packages/$(basename "$t" .tgz)"
  echo "$t --> $bn"
  mkdir -p "$bn"
  tar xfz "$t" -C "$bn"
done

cd ..
