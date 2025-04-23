# Real-world Applications for WOFS

## Quick Start

```bash
bash compile.sh
bash install.sh
```

## Source

- LibLightNVM: https://github.com/Andiry/liblightnvm
- RocksDB: https://github.com/Andiry/RocksDB-pmem (compling with fallocate disabled)
- LevelDB: from SplitFS repository


## Troubleshooting

SplitFS or other user space file systems may not be able to run LevelDB. One reason might be that the `libtcmalloc.so` library is not compatible with the user space file system. There are two possible solutions to this issue:

- Compile LevelDB without `libtcmalloc.so`
  ```shell
    cd leveld-no-tcmalloc
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j32

    mkdir -p /usr/local/leveldb-splitfs/
    mkdir -p /usr/local/leveldb-splitfs/build
    cp -f ./db_bench /usr/local/leveldb-splitfs/build/
    cp -rf ../workloads /usr/local-splitfs/leveldb/
  ```

- Update the `libtcmalloc.so` library to a version that is compatible with the user space file system. We provide the right version of `libtcmalloc.so` (4.6.0) in the `gperftools` folder. Follow these steps to use it:

  ```shell
    cd gperftools
    autogen.sh
    ./configure --prefix=/usr/local/gperftools/
    make -j32
    make install
  ```
    
    Now, change the LevelDB CMakeLists.txt to use the new `libtcmalloc.so` library: Goto 229 line in `lkeveldb/CMakeLists.txt`, and then replace
    ```cmake
    if(HAVE_TCMALLOC)
        target_link_libraries(leveldb tcmalloc)
    endif(HAVE_TCMALLOC)
    ```
    with
    ```cmake
    link_directories(/usr/local/gperftools/lib)
    target_link_libraries(leveldb tcmalloc)
    ```
    Now, recompile LevelDB:
    ```shell
    cd leveldb
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j32

    mkdir -p /usr/local/leveldb-splitfs/
    mkdir -p /usr/local/leveldb-splitfs/build
    cp -f ./db_bench /usr/local/leveldb-splitfs/build/
    cp -rf ../workloads /usr/local-splitfs/leveldb/
    ```
    