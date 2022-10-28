function(target_link_library_includes target scope)
    set(libs ${ARGN})
    foreach(lib ${libs})
        get_target_property(lib_include_dirs ${lib}
                            INTERFACE_INCLUDE_DIRECTORIES)
        if(lib_include_dirs)
            target_include_directories(${target} SYSTEM ${scope}
                                       ${lib_include_dirs})
        else()
            get_target_property(sublibs ${lib} INTERFACE_LINK_LIBRARIES)
            target_link_library_includes(${target} ${scope} ${sublibs})
        endif()
    endforeach()
endfunction()

function(target_link_libraries_system target)
    set(options PRIVATE PUBLIC INTERFACE)
    cmake_parse_arguments(TLLS "${options}" "" "" ${ARGN})
    set(scope PRIVATE)
    foreach(op ${options})
        if(TLLS_${op})
            set(scope ${op})
        endif()
    endforeach()
    set(libs ${TLLS_UNPARSED_ARGUMENTS})

    target_link_library_includes(${target} ${scope} ${libs})
    target_link_libraries(${target} ${scope} ${libs})
endfunction()
