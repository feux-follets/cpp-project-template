cmake_minimum_required(VERSION 3.28)
project(cpp-project-template CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_COMPILE_WARNING_AS_ERROR ON)
set(CMAKE_COLOR_DIAGNOSTICS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# Diagnostic flags
set(WARNINGS
		-Wall
		-Wextra
		-Wpedantic
		-Wconversion
		-Wnon-virtual-dtor
		-Wshadow
)
add_compile_options(${WARNINGS})

# Sanitizers
set(SANITIZERS -fsanitize=thread)
add_compile_options("$<$<CONFIG:Debug>:${SANITIZERS}>")
add_link_options("$<$<CONFIG:Debug>:${SANITIZERS}>")

# Linker
set(LDFLAGS
		-fuse-ld=mold
)
add_link_options(${LDFLAGS})

# Dependencies
find_package(fmt REQUIRED CONFIG)

# Source
add_subdirectory(src)
