cmake_minimum_required(VERSION 3.10)
project(runner LANGUAGES CXX)

set(BINARY_NAME "flutterwomen")
set(APPLICATION_ID "com.example.flutterwomen")

# Prerequisites for standard Linux runner
set(CMAKE_INSTALL_RPATH "$ORIGIN/lib")
