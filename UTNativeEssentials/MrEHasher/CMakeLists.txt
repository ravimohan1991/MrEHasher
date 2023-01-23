#[[
    Abstractions and Models are NOT at WAR!
                                            - Cobwoy's Talisman
    But Abstractions don't care and Models can't understand!!
                                            - Lul, Practicality
 ]]

cmake_minimum_required(VERSION 3.0.0)

project(MrEHasher_Client)

# From BiosReader's cmake
# For complete list of Compiler IDs check output_required_files
# https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_ID.html#variable:CMAKE_%3CLANG%3E_COMPILER_ID
if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-deprecated-enum-enum-conversion")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror-implicit-function-declaration")
endif()

# Let lseek and mmap support 64-bit wide offsets
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_FILE_OFFSET_BITS=64")

# Remember it is SMBIOS data that is stored in LE format
# Our program however can be facing any of the BE or LE (not sure about middle-endian or mixed-endian) compilation palatform
if(CMAKE_C_BYTE_ORDER STREQUAL "BIG_ENDIAN")
	add_compile_definitions(BR_BIG_ENDIAN)
elseif(CMAKE_C_BYTE_ORDER STREQUAL "LITTLE_ENDIAN")
	add_compile_definitions(BR_LITTLE_ENDIAN)
endif()

add_compile_definitions(IMGL3W_IMPL)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
    add_compile_definitions(BR_SIXTY_FOUR_BIT_ISA)
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
    add_compile_definitions(BR_THIRTY_TWO_BIT_ISA)
endif()

if(WIN32)
    add_compile_definitions(BR_WINDOWS_PLATFORM)
	if(MSVC)
	    # For faster multithreaded compilation
        #add_definitions(/MP)
	endif()
elseif(UNIX AND NOT APPLE)
    add_compile_definitions(BR_LINUX_PLATFORM)
    add_compile_definitions(__USE_GNU)
elseif(APPLE)
    add_compile_definitions(BR_MAC_PLATFORM)
    add_compile_definitions(__USE_GNU)
    find_library(IOKit IOKit)
    find_library(CoreServices CoreServices)
    enable_language(OBJC)
    set(CMAKE_C_FLAGS "-x objective-c")
endif()


file(GLOB MrE_HEADERS Inc/*.h)
file(GLOB MrE_SOURCECPP Src/*.cpp)

file(GLOB MrE_SOURCEC Src/*.c)

add_library(MrEHasher_Client SHARED ${MrE_SOURCECPP} ${MrE_SOURCEC} ${MrE_HEADERS})


if(WIN32)
    target_link_libraries(MrEHasher_Client PUBLIC Ws2_32.lib)
elseif(APPLE)
    target_link_libraries(MrEHasher_Client PUBLIC ${CoreServices} ${IOKit})
elseif(UNIX AND NOT APPLE)
    #target_link_libraries(${APPLICATION_NAME} PUBLIC libcapng)
endif()



# INTERFACE (Something that Consumers require but Producers don't)
# Since I am a library coder here, I am the Producer
# Rest of the Engine is Consumer here

target_include_directories(MrEHasher_Client
    PRIVATE
        # where the library itself will look for its internal headers
        ${CMAKE_CURRENT_SOURCE_DIR}/Inc
    PUBLIC
        # where top-level project will look for the library's public headers
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Inc>
        # where external projects will look for the library's public headers
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_compile_definitions(MrEHasher_Client PUBLIC MrEHasher_Client)
