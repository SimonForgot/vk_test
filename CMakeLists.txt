cmake_minimum_required(VERSION 3.23)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

get_filename_component(ProjectId ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE " " "_" ProjectId ${ProjectId})
project(${ProjectId} LANGUAGES CXX)

find_package(Vulkan REQUIRED)
find_package(glfw3 REQUIRED)
find_package(glm REQUIRED)

add_executable(${ProjectId} main.cpp)
target_link_libraries(${ProjectId}  PRIVATE Vulkan::Vulkan glfw glm::glm)
target_compile_options(${ProjectId} PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/MD>)

add_custom_target(run COMMAND $<TARGET_FILE:${ProjectId}>)
