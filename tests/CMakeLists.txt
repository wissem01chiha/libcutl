# CMake build for libcutl
#
# Written by Wissem Chiha <chihawissem08@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA


add_executable(compiler-cxx-indenter
    compiler/cxx-indenter/driver.cxx
)
target_link_libraries(compiler-cxx-indenter PRIVATE cutl)
add_dependencies(compiler-cxx-indenter cutl)
add_test(NAME compiler-cxx-indenter
    COMMAND compiler-cxx-indenter output.std
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/compiler/cxx-indenter
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/compiler/cxx-indenter/output.std
    ${CMAKE_CURRENT_BINARY_DIR}/compiler/cxx-indenter/output.std
    COPYONLY
)

add_executable(compiler-sloc-counter
    compiler/sloc-counter/driver.cxx
)
target_link_libraries(compiler-sloc-counter PRIVATE cutl)
add_dependencies(compiler-sloc-counter cutl)
add_test(NAME compiler-sloc-counter
    COMMAND compiler-sloc-counter output.std
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/compiler/sloc-counter
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/compiler/sloc-counter/test.std
    ${CMAKE_CURRENT_BINARY_DIR}/compiler/sloc-counter/test.std
    COPYONLY
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/compiler/sloc-counter/test.cxx
    ${CMAKE_CURRENT_BINARY_DIR}/compiler/sloc-counter/test.cxx
    COPYONLY
)

add_executable(compiler-cxx-traversal
    compiler/cxx-traversal/driver.cxx
)
target_link_libraries(compiler-cxx-traversal PRIVATE cutl)
add_dependencies(compiler-cxx-traversal cutl)
add_test(NAME compiler-cxx-traversal
    COMMAND compiler-cxx-traversal output.std
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/compiler/cxx-traversal
)
configure_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/compiler/cxx-traversal/output.std
    ${CMAKE_CURRENT_BINARY_DIR}/compiler/cxx-traversal/output.std
    COPYONLY
)

add_executable(container-multi-index
    container/multi-index/driver.cxx
)
target_link_libraries(container-multi-index PRIVATE cutl)
add_dependencies(container-multi-index cutl)
add_test(NAME container-multi-index
    COMMAND container-multi-index 
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/container/multi-index
)

