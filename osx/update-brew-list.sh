#!/bin/bash

brew leaves > tmp.txt
cat brew-list.txt >> tmp.txt
cat tmp.txt | sort | uniq > brew-list.txt
rm tmp.txt
