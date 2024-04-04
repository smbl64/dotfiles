#!/bin/bash
cat "$HOME/.bash_history" | awk '{printf("%s\n", $1)}' | sort | uniq -c | sort -n
#cat "$HOME/.bash_history" | awk '{printf("%s %s\n", $1, $2)}' | sort | uniq -c | sort -n
