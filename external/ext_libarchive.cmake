# source: https://github.com/libarchive/libarchive
# target: archive_static, archive

include(${CMAKE_CURRENT_LIST_DIR}/external.cmake)

set(EXT_VERSION "3.7.1")
set(EXT_URL_HASH "SHA256=16041be93a7c60d1ab6147102168a77b5a464a2cb579495ac1add89d8d1f3f74")

AddExternalProject(
  archive
  UPDATE_DISCONNECTED true
  URL https://github.com/libarchive/libarchive/archive/refs/tags/v${EXT_VERSION}.zip
  URL_HASH ${EXT_URL_HASH}
  CMAKE_ARGS
    -D CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -D CMAKE_PREFIX_PATH=${EXTERNAL_INSTALL_LOCATION}
    -D CMAKE_INSTALL_PREFIX=${EXTERNAL_INSTALL_LOCATION}

    -D ENABLE_MBEDTLS=OFF
    -D ENABLE_NETTLE=OFF
    -D ENABLE_OPENSSL=OFF

    -D ENABLE_LIBB2=OFF
    -D ENABLE_LZ4=OFF
    -D ENABLE_LZO=OFF
    -D ENABLE_LZMA=ON
    -D ENABLE_ZSTD=OFF
    -D ENABLE_ZLIB=ON
    -D ENABLE_BZip2=OFF
    -D ENABLE_LIBXML2=OFF
    -D ENABLE_EXPAT=OFF
    -D ENABLE_PCREPOSIX=OFF
    -D ENABLE_LibGCC=OFF
    -D ENABLE_CNG=ON

    -D ENABLE_TAR=OFF
    -D ENABLE_TAR_SHARED=OFF
    -D ENABLE_CPIO=OFF
    -D ENABLE_CPIO_SHARED=OFF
    -D ENABLE_CAT=OFF
    -D ENABLE_CAT_SHARED=OFF

    -D ENABLE_XATTR=ON
    -D ENABLE_ACL=ON
    -D ENABLE_ICONV=ON

    -D ENABLE_TEST=OFF
    -D ENABLE_COVERAGE=OFF
    -D ENABLE_INSTALL=ON
)
