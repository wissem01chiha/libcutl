# install library

install(TARGETS cutl
    EXPORT libcutlTargets
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# install headers
file(GLOB_RECURSE LIBCUTL_HEADERS CONFIGURE_DEPENDS
    RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}"
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl/*.hxx"
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl/*.ixx"
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl/*.txx"
)

foreach(header IN LISTS LIBCUTL_HEADERS)
    get_filename_component(header_dir "${header}" DIRECTORY)
    install(FILES "${CMAKE_CURRENT_SOURCE_DIR}/${header}"
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${header_dir}"
    )
endforeach()

set(LIBCUTL_CMAKE_INSTALL_DIR
    "${CMAKE_INSTALL_LIBDIR}/cmake/libcutl"
)

# install the exported target information.
install(
    EXPORT libcutlTargets
    FILE libcutlTargets.cmake
    NAMESPACE libcutl::
    DESTINATION "${LIBCUTL_CMAKE_INSTALL_DIR}"
)

# generate libcutlConfig.cmake file
configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/libcutlConfig.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/libcutlConfig.cmake"
    @ONLY
)

install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/libcutlConfig.cmake"
    DESTINATION "${LIBCUTL_CMAKE_INSTALL_DIR}"
)

# pkg-config
set(LIBCUTL_PKGCONFIG_INSTALL_DIR
    "${CMAKE_INSTALL_LIBDIR}/pkgconfig"
)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl.pc.in"
    "${CMAKE_CURRENT_BINARY_DIR}/libcutl.pc"
    @ONLY
)

install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/libcutl.pc"
    DESTINATION "${LIBCUTL_PKGCONFIG_INSTALL_DIR}"
)