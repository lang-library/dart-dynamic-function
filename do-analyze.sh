#! /usr/bin/env bash
set -uvx
set -e
dart analyze . --fatal-infos
