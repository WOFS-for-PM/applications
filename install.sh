#!/usr/bin/env bash

echo "Installing RocksDB and LevelDB..."

mkdir -p /usr/local/RocksDB-pmem/
cp -f ./RocksDB-pmem/db_bench /usr/local/RocksDB-pmem/

mkdir -p /usr/local/leveldb/
mkdir -p /usr/local/leveldb/build
cp -f ./leveldb/build/db_bench /usr/local/leveldb/build/
cp -rf ./leveldb/workloads /usr/local/leveldb/

mkdir -p /usr/local/leveldb-splitfs/
mkdir -p /usr/local/leveldb-splitfs/build
cp -f ./leveldb/build/db_bench /usr/local/leveldb-splitfs/build/
cp -rf ./leveldb/workloads /usr/local-splitfs/leveldb/

echo "Done!"