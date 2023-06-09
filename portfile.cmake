
vcpkg_from_git(
    OUT_SOURCE_PATH SOURCE_PATH
    URL ~/repos/ez
    REF  b3aaf77fcb266ade719402c7399bce90f86c161e
	)
# git rev-parse  HEAD

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DINSTALL_DOCS=OFF
        -DINSTALL_PKG_CONFIG_MODULE=ON
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
# vcpkg_copy_tools(TOOL_NAMES sum)
# vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/Ogg PACKAGE_NAME ogg)

vcpkg_copy_tools(
    TOOL_NAMES embed
)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()
 
 
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/bin" "${CURRENT_PACKAGES_DIR}/debug/bin")
 
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")