#/usr/bin/env sh

# Exit on error
set -e

panic() { printf "$1\n" && exit 1 };

# Make sure we are in the directory of the script
cd "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

SRC_PATH="$PWD/code"
CUSTOM_PATH="$PWD/code/custom"
OS=$(uname | tr '[:upper:]' '[:lower:]')

CXXFLAGS="-g -D_GNU_SOURCE -fPIC -fpermissive -I$SRC_PATH -I$CUSTOM_PATH"

case "$OS" in
linux*)
    CXX=g++
    ;;
darwin*)
    CXX=clang++
    ;;
*)
    panic "$0: error: $OS is not supported"
esac

cd "$SRC_PATH"

eval "$CXX $CXXFLAGS $SRC_PATH/build.cpp -o build $*"
./build
