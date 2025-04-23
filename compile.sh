#!/usr/bin/env bash

echo "Compiling Liblightnvm..."
cd liblightnvm || exit
make -j16
make install

echo "Compiling RocksDB..."
cd ../RocksDB-pmem || exit
make db_bench

echo "Compiling LevelDB..."
cd ../leveldb || exit
mkdir -p build
cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j16

echo "Done!"

