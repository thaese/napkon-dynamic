#!/bin/sh

./packages/untar_packages.sh
ls -al $HOME/.fhir/packages

java -jar ./input-cache/publisher.jar publisher -ig .
