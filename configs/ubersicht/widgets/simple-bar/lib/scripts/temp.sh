#!/usr/bin/env bash
istats scan TC0E --value-only | awk '{print int($1+0.5)}' | sed 's/$/°C/'
