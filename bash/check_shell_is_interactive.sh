#!/usr/bin/env bash

# "$-" is a string listing of all the current shell option flags. It will contain i if the shell is interactive.
case "$-" in
    *i*) # Code for interactive shell here
     ;;
    *)   # Code for noninteractive shell here
     ;;
esac
