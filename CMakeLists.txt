cmake_minimum_required(VERSION 3.29)
project(cpp-project-template CXX)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_COMPILE_WARNING_AS_ERROR ON)
set(CMAKE_COLOR_DIAGNOSTICS ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)
set(CMAKE_LINKER_TYPE MOLD)
set(CMAKE_CXX_CLANG_TIDY clang-tidy)

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
set(SANITIZERS -fsanitize=address)
add_compile_options("$<$<CONFIG:Debug>:${SANITIZERS}>")
add_link_options("$<$<CONFIG:Debug>:${SANITIZERS}>")

# Dependencies

# Source
add_subdirectory(src)
