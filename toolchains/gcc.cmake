set(TOOLCHAIN_ROOT "/usr")
if(DEFINED ENV{TOOLCHAIN_ROOT})
    set(TOOLCHAIN_ROOT $ENV{TOOLCHAIN_ROOT})
endif()

set(CMAKE_C_COMPILER "${TOOLCHAIN_ROOT}/bin/gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_ROOT}/bin/g++")

if(DEFINED ENV{CC})
    set(CMAKE_C_COMPILER $ENV{CC})
endif()
if(DEFINED ENV{CXX})
    set(CMAKE_CXX_COMPILER $ENV{CXX})
endif()
