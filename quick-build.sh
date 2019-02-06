#!/bin/bash

cd $1
docker build -t jonberenguer/$1 .
