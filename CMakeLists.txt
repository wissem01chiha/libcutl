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

cmake_minimum_required(VERSION 3.16 FATAL_ERROR)

project(libcutl
    VERSION 1.11.0
    LANGUAGES CXX
    DESCRIPTION "C++ utility library for compilers"
    HOMEPAGE_URL "https://www.codesynthesis.com/projects/libcutl/"
)

option(LIBCUTL_BUILD_TESTS "build libcutl tests" OFF)

include(GNUInstallDirs)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

set(cutl_compiler_sources
    libcutl/compiler/code-stream.hxx
    libcutl/compiler/code-stream.txx
    libcutl/compiler/context.cxx
    libcutl/compiler/context.hxx
    libcutl/compiler/context.txx
    libcutl/compiler/cxx-indenter.cxx
    libcutl/compiler/cxx-indenter.hxx
    libcutl/compiler/cxx-indenter.txx
    libcutl/compiler/sloc-counter.hxx
    libcutl/compiler/sloc-counter.txx
    libcutl/compiler/traversal.hxx
    libcutl/compiler/traversal.txx
    libcutl/compiler/type-id.hxx
    libcutl/compiler/type-id.txx
    libcutl/compiler/type-info.cxx
    libcutl/compiler/type-info.hxx
)

set(cutl_container_sources
    libcutl/container/any.hxx
    libcutl/container/graph.hxx
    libcutl/container/graph.txx
    libcutl/container/key.hxx
    libcutl/container/map-iterator.hxx
    libcutl/container/multi-index.hxx
    libcutl/container/pointer-iterator.hxx
)

set(cutl_fs_sources
    libcutl/fs/auto-remove.cxx
    libcutl/fs/auto-remove.hxx
    libcutl/fs/exception.cxx
    libcutl/fs/exception.hxx
    libcutl/fs/path.cxx
    libcutl/fs/path.hxx
    libcutl/fs/path.txx
)

set(cutl_meta_sources
    libcutl/meta/answer.hxx
    libcutl/meta/class-p.hxx
    libcutl/meta/polymorphic-p.hxx
    libcutl/meta/remove-c.hxx
    libcutl/meta/remove-cv.hxx
    libcutl/meta/remove-p.hxx
    libcutl/meta/remove-v.hxx
)

set(cutl_re_sources
    libcutl/re.hxx
    libcutl/re/re.cxx
    libcutl/re/re.txx
)

set(cutl_shared_ptr_sources
    libcutl/shared-ptr.hxx
    libcutl/shared-ptr/base.cxx
    libcutl/shared-ptr/base.hxx
    libcutl/shared-ptr/base.txx
    libcutl/static-ptr.hxx
)

set(cutl_root_sources
    libcutl/exception.cxx
    libcutl/exception.hxx
)

set(cutl_sources
    ${cutl_compiler_sources}
    ${cutl_container_sources}
    ${cutl_fs_sources}
    ${cutl_meta_sources}
    ${cutl_re_sources}
    ${cutl_shared_ptr_sources}
    ${cutl_root_sources}
)

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl/version.hxx.in"
    "${CMAKE_CURRENT_SOURCE_DIR}/libcutl/version.hxx"
    @ONLY
)

if(BUILD_SHARED_LIBS)
    add_library(cutl SHARED ${cutl_sources})
else()
    add_library(cutl STATIC ${cutl_sources})
endif()

target_include_directories(cutl
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
)

set_target_properties(cutl PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

set_target_properties(cutl PROPERTIES
    OUTPUT_NAME cutl
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED ON
)

if(LIBCUTL_BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

include(install)
