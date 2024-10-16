TiaC Systems Network (TSN) Ubuntu Build Essentials Workspace
============================================================

This repository contains the build configuration of the `Ubuntu for developers`_
workspace for TiaC Systems Network (TSN) as multi-arch Docker images for Linux.

.. _`Ubuntu for developers`: https://ubuntu.com/desktop/developers

Documentation
-------------

The documentation overview is in this `readme in the project root directory
<README.rst>`_.

Content
-------

Based on our own `TSN ASDF Workspace Docker image`_, |tsn-asdf-ws-tag|:

- Docker image architectures:

  - Intel/AMD x86 64-bit (``linux/amd64``)
  - ARMv7 32-bit (``linux/arm/v7``)
  - ARMv8 64-bit (``linux/arm64/v8``)
  - RISC-V 64-bit (``linux/riscv64``)
  - IBM POWER8 (``linux/ppc64le``)
  - IBM z-Systems (``linux/s390x``)

.. _`TSN ASDF Workspace Docker image`: https://github.com/tiacsys/tsn-asdf-ws
.. |tsn-asdf-ws-tag| replace:: :strong:`ghcr.io/tiacsys/tsn-asdf-ws:2024.10.1`

.. early references:

.. _`JIT`: https://en.wikipedia.org/wiki/Just-in-time_compilation
.. _`LALR`: https://en.wikipedia.org/wiki/LALR_parser
.. _`TDFA`: https://en.wikipedia.org/wiki/Tagged_Deterministic_Finite_Automaton
.. _`YACC`: https://en.wikipedia.org/wiki/Yet_Another_Compiler_Compiler

Ubuntu system packages
**********************

.. rubric:: Basic development tools

- |build-essential-version|_

  - basic system C/C++ compiler: ``gcc`` / ``g++``
  - basic system API C library: ``<libc-dev>`` / ``<linux-kernel-headers>``
  - basic system API C++ library: ``<libstdc++-dev>``
  - system package development tools: ``dpkg-dev``
  - utility for directing compilation: ``make``

.. |build-essential-version| replace:: list of build-essential packages :strong:`v12.10`
.. _`build-essential-version`: https://packages.ubuntu.com/noble/build-essential

.. rubric:: GNU development tools

- |gperf-version|_
- |make-guile-version|_
- |pkg-config-version|_

.. |gperf-version| replace:: GNU gperf :strong:`v3.1`
.. _`gperf-version`: https://packages.ubuntu.com/noble/gperf

.. |make-guile-version| replace:: GNU Make with Guile support :strong:`v4.3`
.. _`make-guile-version`: https://packages.ubuntu.com/noble/make-guile

.. |pkg-config-version| replace:: pkgconf (pkg-config) :strong:`v1.8.1`
.. _`pkg-config-version`: https://packages.ubuntu.com/noble/pkg-config

.. rubric:: GNU autotools

- |autoconf-dickey-version|_
- |autoconf2.13-version|_
- |autoconf2.64-version|_
- |autoconf2.69-version|_
- |autoconf-version|_

  - |autoconf-archive-version|_

- |automake1.11-version|_
- |automake-version|_
- |autogen-version|_
- |gettext-version|_

  - |autopoint-version|_, for setting up gettext infrastructure

- |libtool-version|_

  - |libltdl-dev-version|_, system independent dlopen wrapper

.. |autoconf-dickey-version| replace:: GNU autoconf (Thomas Dickey's version) :strong:`v2.52`
.. _`autoconf-dickey-version`: https://packages.ubuntu.com/noble/autoconf-dickey

.. |autoconf2.13-version| replace:: GNU autoconf :strong:`v2.13`
.. _`autoconf2.13-version`: https://packages.ubuntu.com/noble/autoconf2.13

.. |autoconf2.64-version| replace:: GNU autoconf :strong:`v2.64`
.. _`autoconf2.64-version`: https://packages.ubuntu.com/noble/autoconf2.64

.. |autoconf2.69-version| replace:: GNU autoconf :strong:`v2.69`
.. _`autoconf2.69-version`: https://packages.ubuntu.com/noble/autoconf2.69

.. |autoconf-version| replace:: GNU autoconf :strong:`v2.71`
.. _`autoconf-version`: https://packages.ubuntu.com/noble/autoconf

.. |autoconf-archive-version| replace:: Autoconf Macro Archive :strong:`20220903`
.. _`autoconf-archive-version`: https://packages.ubuntu.com/noble/autoconf-archive

.. |automake1.11-version| replace:: GNU automake :strong:`v1.11`
.. _`automake1.11-version`: https://packages.ubuntu.com/noble/automake1.11

.. |automake-version| replace:: GNU automake :strong:`v1.16`
.. _`automake-version`: https://packages.ubuntu.com/noble/automake

.. |autogen-version| replace:: GNU autogen :strong:`v5.18.16`
.. _`autogen-version`: https://packages.ubuntu.com/noble/autogen

.. |gettext-version| replace:: GNU gettext :strong:`v0.21`
.. _`gettext-version`: https://packages.ubuntu.com/noble/gettext

.. |autopoint-version| replace:: GNU autopoint :strong:`v0.21`
.. _`autopoint-version`: https://packages.ubuntu.com/noble/autopoint

.. |libtool-version| replace:: GNU libtool :strong:`v2.4.7`
.. _`libtool-version`: https://packages.ubuntu.com/noble/libtool

.. |libltdl-dev-version| replace:: GNU libtool (headers) :strong:`v2.4.7`
.. _`libltdl-dev-version`: https://packages.ubuntu.com/noble/libltdl-dev

.. rubric:: Additional development tools

- |cmake-version|_
- |cmake-format-version|_
- |ninja-build-version|_

.. |cmake-version| replace:: CMake cross-platform make system :strong:`v3.28.3`
.. _`cmake-version`: https://packages.ubuntu.com/noble/cmake

.. |cmake-format-version| replace:: CMake listfiles code formatter :strong:`v0.6.13`
.. _`cmake-format-version`: https://packages.ubuntu.com/noble/cmake-format

.. |ninja-build-version| replace:: Ninja small build system :strong:`v1.11.1`
.. _`ninja-build-version`: https://packages.ubuntu.com/noble/ninja-build

- |nanopb-version|_
- |protobuf-compiler-version|_

.. |nanopb-version| replace:: Protocol Buffers with small code size :strong:`v0.4.8`
.. _`nanopb-version`: https://packages.ubuntu.com/noble/nanopb

.. |protobuf-compiler-version| replace:: Protocol Buffers compiler :strong:`v3.21.12`
.. _`protobuf-compiler-version`: https://packages.ubuntu.com/noble/protobuf-compiler

- |musl-tools-version|_
- |dietlibc-dev-version|_ (not on ``linux/riscv64``)
- |libboost-all-dev-version|_

.. |musl-tools-version| replace:: Static Lib-C for embedded Linux :strong:`v1.2.4`
.. _`musl-tools-version`: https://packages.ubuntu.com/noble/musl-tools

.. |dietlibc-dev-version| replace:: Small size optimized Lib-C :strong:`v0.34`
.. _`dietlibc-dev-version`: https://packages.ubuntu.com/noble/dietlibc-dev

.. |libboost-all-dev-version| replace:: Boost C++ Libraries :strong:`v1.38.0`
.. _`libboost-all-dev-version`: https://packages.ubuntu.com/noble/libboost-all-dev

- |bcc-version|_
- |bin86-version|_
- |elks-libc-version|_

.. |bcc-version| replace:: 16-bit x86 C compiler :strong:`v0.16.17`
.. _`bcc-version`: https://packages.ubuntu.com/noble/bcc

.. |bin86-version| replace:: 16-bit x86 assembler and loader :strong:`v0.16.17`
.. _`bin86-version`: https://packages.ubuntu.com/noble/bin86

.. |elks-libc-version| replace:: 16-bit x86 C library and include files :strong:`v0.16.17`
.. _`elks-libc-version`: https://packages.ubuntu.com/noble/elks-libc

- |nasm-version|_
- |x86dis-version|_

.. |nasm-version| replace:: General-purpose x86 assembler :strong:`v2.16.01`
.. _`nasm-version`: https://packages.ubuntu.com/noble/nasm

.. |x86dis-version| replace:: Lib-based x86 disassembler :strong:`v0.23`
.. _`x86dis-version`: https://packages.ubuntu.com/noble/x86dis

.. csv-table:: Low-Level Virtual Machine (LLVM)
   :header: "[*]_", "LLVM", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|llvm-name|_",           " ", " ", " ", " ", " ", " "
   " ", "|llvm-14-dev-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|llvm-15-dev-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|llvm-16-dev-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|llvm-17-dev-version|_", "x", "x", "x", "x", "x", "x"
   "x", "|llvm-dev-version|_",    "x", "x", "x", "x", "x", "x"
   " ", "|lld-name|_",            " ", " ", " ", " ", " ", " "
   " ", "|lld-14-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|lld-15-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|lld-16-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|lld-17-version|_",      "x", "x", "x", "x", "x", "x"
   "x", "|lld-version|_",         "x", "x", "x", "x", "x", "x"

.. [*] Default version.

.. |llvm-name| replace:: :strong:`LLVM Modular compiler`
.. _`llvm-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=llvm

.. |llvm-14-dev-version| replace:: :strong:`v14.0.6`
.. _`llvm-14-dev-version`: https://packages.ubuntu.com/noble/llvm-14-dev

.. |llvm-15-dev-version| replace:: :strong:`v15.0.7`
.. _`llvm-15-dev-version`: https://packages.ubuntu.com/noble/llvm-15-dev

.. |llvm-16-dev-version| replace:: :strong:`v16.0.6`
.. _`llvm-16-dev-version`: https://packages.ubuntu.com/noble/llvm-16-dev

.. |llvm-17-dev-version| replace:: :strong:`v17.0.6`
.. _`llvm-17-dev-version`: https://packages.ubuntu.com/noble/llvm-17-dev

.. |llvm-dev-version| replace:: :strong:`v18.1.3`
.. _`llvm-dev-version`: https://packages.ubuntu.com/noble/llvm-dev

.. |lld-name| replace:: :strong:`LLVM-based linker`
.. _`lld-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=lld

.. |lld-14-version| replace:: :strong:`v14.0.6`
.. _`lld-14-version`: https://packages.ubuntu.com/noble/lld-14

.. |lld-15-version| replace:: :strong:`v15.0.7`
.. _`lld-15-version`: https://packages.ubuntu.com/noble/lld-15

.. |lld-16-version| replace:: :strong:`v16.0.6`
.. _`lld-16-version`: https://packages.ubuntu.com/noble/lld-16

.. |lld-17-version| replace:: :strong:`v17.0.6`
.. _`lld-17-version`: https://packages.ubuntu.com/noble/lld-17

.. |lld-version| replace:: :strong:`v18.1.3`
.. _`lld-version`: https://packages.ubuntu.com/noble/lld

.. csv-table:: Rust programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|cargo-name|_",               " ", " ", " ", " ", " ", " "
   "x", "|cargo-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|cargo-1.80-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|rust-name|_",                " ", " ", " ", " ", " ", " "
   "x", "|rustc-version|_",            "x", "x", "x", "x", "x", "x"
   "x", "|rust-clippy-version|_",      "x", "x", "x", "x", "x", "x"
   "x", "|rustfmt-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|rustc-1.80-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|rust-1.80-clippy-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|rustfmt-1.80-version|_",     "x", "x", "x", "x", "x", "x"

.. [*] Default version.

.. |cargo-name| replace:: Cargo (package manager)
.. _`cargo-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=cargo

.. |cargo-version| replace:: :strong:`v1.75.0`
.. _`cargo-version`: https://packages.ubuntu.com/noble/cargo

.. |cargo-1.80-version| replace:: :strong:`v1.80.1`
.. _`cargo-1.80-version`: https://packages.ubuntu.com/noble/cargo-1.80

.. |rust-name| replace:: Rust compiler
.. _`rust-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=rust

.. |rustc-version| replace:: :strong:`v1.75.0`
.. _`rustc-version`: https://packages.ubuntu.com/noble/rustc

.. |rust-clippy-version| replace:: |____| → linter tool
.. _`rust-clippy-version`: https://packages.ubuntu.com/noble/rust-clippy

.. |rustfmt-version| replace:: |____| → code formatter
.. _`rustfmt-version`: https://packages.ubuntu.com/noble/rustfmt

.. |rustc-1.80-version| replace:: :strong:`v1.80.1`
.. _`rustc-1.80-version`: https://packages.ubuntu.com/noble/rustc-1.80

.. |rust-1.80-clippy-version| replace:: |____| → linter tool
.. _`rust-1.80-clippy-version`: https://packages.ubuntu.com/noble/rust-1.80-clippy

.. |rustfmt-1.80-version| replace:: |____| → code formatter
.. _`rustfmt-1.80-version`: https://packages.ubuntu.com/noble/rustfmt-1.80

.. csv-table:: Java programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|openjdk-name|_",           " ", " ", " ", " ", " ", " "
   " ", "|openjdk-8-jdk-version|_",  "x", "x", "x", " ", "x", "x"
   " ", "|openjdk-11-jdk-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|openjdk-17-jdk-version|_", "x", "x", "x", "x", "x", "x"
   "x", "|openjdk-21-jdk-version|_", "x", "x", "x", "x", "x", "x"

.. [*] Default version.

.. |openjdk-name| replace:: OpenJDK Development Kit (JDK)
.. _`openjdk-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=openjdk

.. |openjdk-8-jdk-version| replace:: :strong:`v8u422`
.. _`openjdk-8-jdk-version`: https://packages.ubuntu.com/noble/openjdk-8-jdk

.. |openjdk-11-jdk-version| replace:: :strong:`v11.0.24`
.. _`openjdk-11-jdk-version`: https://packages.ubuntu.com/noble/openjdk-11-jdk

.. |openjdk-17-jdk-version| replace:: :strong:`v17.0.12`
.. _`openjdk-17-jdk-version`: https://packages.ubuntu.com/noble/openjdk-17-jdk

.. |openjdk-21-jdk-version| replace:: :strong:`v21.0.4`
.. _`openjdk-21-jdk-version`: https://packages.ubuntu.com/noble/openjdk-21-jdk

.. csv-table:: C/C++ and Objective-C/C++ programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|clang-name|_",                  " ", " ", " ", " ", " ", " "
   " ", "|clang-14-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|clang-format-14-version|_",     "x", "x", "x", "x", "x", "x"
   " ", "|clang-tools-14-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|clang-tidy-14-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|clang-15-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|clang-format-15-version|_",     "x", "x", "x", "x", "x", "x"
   " ", "|clang-tools-15-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|clang-tidy-15-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|clang-16-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|clang-format-16-version|_",     "x", "x", "x", "x", "x", "x"
   " ", "|clang-tools-16-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|clang-tidy-16-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|clang-17-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|clang-format-17-version|_",     "x", "x", "x", "x", "x", "x"
   " ", "|clang-tools-17-version|_",      "x", "x", "x", "x", "x", "x"
   " ", "|clang-tidy-17-version|_",       "x", "x", "x", "x", "x", "x"
   "x", "|clang-version|_",               "x", "x", "x", "x", "x", "x"
   "x", "|clang-format-version|_",        "x", "x", "x", "x", "x", "x"
   "x", "|clang-tools-version|_",         "x", "x", "x", "x", "x", "x"
   "x", "|clang-tidy-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gcc-name|_",                    " ", " ", " ", " ", " ", " "
   " ", "|gcc-10-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|gcc-10-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|gcc-11-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|gcc-11-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|gcc-12-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|gcc-12-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   "x", "|gcc-version|_",                 "x", "x", "x", "x", "x", "x"
   "x", "|gcc-multilib-version|_",        "x", " ", " ", " ", " ", "x"
   "x", "|gcc-mingw-w64-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|gcc-14-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|gcc-14-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|g++-name|_",                    " ", " ", " ", " ", " ", " "
   " ", "|g++-10-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|g++-10-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|g++-11-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|g++-11-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|g++-12-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|g++-12-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   "x", "|g++-version|_",                 "x", "x", "x", "x", "x", "x"
   "x", "|g++-multilib-version|_",        "x", " ", " ", " ", " ", "x"
   "x", "|g++-mingw-w64-version|_",       "x", "x", "x", "x", "x", "x"
   " ", "|g++-14-version|_",              "x", "x", "x", "x", "x", "x"
   " ", "|g++-14-multilib-version|_",     "x", " ", " ", " ", " ", "x"
   " ", "|gobjc-name|_",                  " ", " ", " ", " ", " ", " "
   " ", "|gobjc-10-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|gobjc-10-multilib-version|_",   "x", " ", " ", " ", " ", "x"
   " ", "|gobjc-11-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|gobjc-11-multilib-version|_",   "x", " ", " ", " ", " ", "x"
   " ", "|gobjc-12-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|gobjc-12-multilib-version|_",   "x", " ", " ", " ", " ", "x"
   "x", "|gobjc-version|_",               "x", "x", "x", "x", "x", "x"
   "x", "|gobjc-multilib-version|_",      "x", " ", " ", " ", " ", "x"
   "x", "|gobjc-mingw-w64-version|_",     "x", "x", "x", "x", "x", "x"
   " ", "|gobjc-14-version|_",            "x", "x", "x", "x", "x", "x"
   " ", "|gobjc-14-multilib-version|_",   "x", " ", " ", " ", " ", "x"
   " ", "|gobjc++-name|_",                " ", " ", " ", " ", " ", " "
   " ", "|gobjc++-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gobjc++-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gobjc++-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gobjc++-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gobjc++-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gobjc++-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|gobjc++-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|gobjc++-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   "x", "|gobjc++-mingw-w64-version|_",   "x", "x", "x", "x", "x", "x"
   " ", "|gobjc++-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gobjc++-14-multilib-version|_", "x", " ", " ", " ", " ", "x"

.. [*] Default version.

.. |clang-name| replace:: :strong:`Clang compiler`
.. _`clang-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=clang

.. |clang-14-version| replace:: :strong:`v14.0.6`
.. _`clang-14-version`: https://packages.ubuntu.com/noble/clang-14

.. |clang-format-14-version| replace:: |____| → code formatter
.. _`clang-format-14-version`: https://packages.ubuntu.com/noble/clang-format-14

.. |clang-tools-14-version| replace:: |____| → development tools
.. _`clang-tools-14-version`: https://packages.ubuntu.com/noble/clang-tools-14

.. |clang-tidy-14-version| replace:: |____| → linter tool
.. _`clang-tidy-14-version`: https://packages.ubuntu.com/noble/clang-tidy-14

.. |clang-15-version| replace:: :strong:`v15.0.7`
.. _`clang-15-version`: https://packages.ubuntu.com/noble/clang-15

.. |clang-format-15-version| replace:: |____| → code formatter
.. _`clang-format-15-version`: https://packages.ubuntu.com/noble/clang-format-15

.. |clang-tools-15-version| replace:: |____| → development tools
.. _`clang-tools-15-version`: https://packages.ubuntu.com/noble/clang-tools-15

.. |clang-tidy-15-version| replace:: |____| → linter tool
.. _`clang-tidy-15-version`: https://packages.ubuntu.com/noble/clang-tidy-15

.. |clang-16-version| replace:: :strong:`v16.0.6`
.. _`clang-16-version`: https://packages.ubuntu.com/noble/clang-16

.. |clang-format-16-version| replace:: |____| → code formatter
.. _`clang-format-16-version`: https://packages.ubuntu.com/noble/clang-format-16

.. |clang-tools-16-version| replace:: |____| → development tools
.. _`clang-tools-16-version`: https://packages.ubuntu.com/noble/clang-tools-16

.. |clang-tidy-16-version| replace:: |____| → linter tool
.. _`clang-tidy-16-version`: https://packages.ubuntu.com/noble/clang-tidy-16

.. |clang-17-version| replace:: :strong:`v17.0.6`
.. _`clang-17-version`: https://packages.ubuntu.com/noble/clang-17

.. |clang-format-17-version| replace:: |____| → code formatter
.. _`clang-format-17-version`: https://packages.ubuntu.com/noble/clang-format-17

.. |clang-tools-17-version| replace:: |____| → development tools
.. _`clang-tools-17-version`: https://packages.ubuntu.com/noble/clang-tools-17

.. |clang-tidy-17-version| replace:: |____| → linter tool
.. _`clang-tidy-17-version`: https://packages.ubuntu.com/noble/clang-tidy-17

.. |clang-version| replace:: :strong:`v18.1.3`
.. _`clang-version`: https://packages.ubuntu.com/noble/clang

.. |clang-format-version| replace:: |____| → code formatter
.. _`clang-format-version`: https://packages.ubuntu.com/noble/clang-format

.. |clang-tools-version| replace:: |____| → development tools
.. _`clang-tools-version`: https://packages.ubuntu.com/noble/clang-tools

.. |clang-tidy-version| replace:: |____| → linter tool
.. _`clang-tidy-version`: https://packages.ubuntu.com/noble/clang-tidy

.. |gcc-name| replace:: :strong:`GNU C compiler`
.. _`gcc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gcc

.. |g++-name| replace:: :strong:`GNU C++ compiler`
.. _`g++-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=g%2B%2B

.. |gcc-10-version| replace:: :strong:`v10.5`
.. _`gcc-10-version`: https://packages.ubuntu.com/noble/gcc-10

.. |gcc-10-multilib-version| replace:: |____| → multilib files
.. _`gcc-10-multilib-version`: https://packages.ubuntu.com/noble/gcc-10-multilib

.. |g++-10-version| replace:: :strong:`v10.5`
.. _`g++-10-version`: https://packages.ubuntu.com/noble/g++-10

.. |g++-10-multilib-version| replace:: |____| → multilib files
.. _`g++-10-multilib-version`: https://packages.ubuntu.com/noble/g++-10-multilib

.. |gcc-11-version| replace:: :strong:`v11.4`
.. _`gcc-11-version`: https://packages.ubuntu.com/noble/gcc-11

.. |gcc-11-multilib-version| replace:: |____| → multilib files
.. _`gcc-11-multilib-version`: https://packages.ubuntu.com/noble/gcc-11-multilib

.. |g++-11-version| replace:: :strong:`v11.4`
.. _`g++-11-version`: https://packages.ubuntu.com/noble/g++-11

.. |g++-11-multilib-version| replace:: |____| → multilib files
.. _`g++-11-multilib-version`: https://packages.ubuntu.com/noble/g++-11-multilib

.. |gcc-12-version| replace:: :strong:`v12.3`
.. _`gcc-12-version`: https://packages.ubuntu.com/noble/gcc-12

.. |gcc-12-multilib-version| replace:: |____| → multilib files
.. _`gcc-12-multilib-version`: https://packages.ubuntu.com/noble/gcc-12-multilib

.. |g++-12-version| replace:: :strong:`v12.3`
.. _`g++-12-version`: https://packages.ubuntu.com/noble/g++-12

.. |g++-12-multilib-version| replace:: |____| → multilib files
.. _`g++-12-multilib-version`: https://packages.ubuntu.com/noble/g++-12-multilib

.. |gcc-version| replace:: :strong:`v13.2`
.. _`gcc-version`: https://packages.ubuntu.com/noble/gcc

.. |gcc-multilib-version| replace:: |____| → multilib files
.. _`gcc-multilib-version`: https://packages.ubuntu.com/noble/gcc-multilib

.. |gcc-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`gcc-mingw-w64-version`: https://packages.ubuntu.com/noble/gcc-mingw-w64

.. |g++-version| replace:: :strong:`v13.2`
.. _`g++-version`: https://packages.ubuntu.com/noble/g++

.. |g++-multilib-version| replace:: |____| → multilib files
.. _`g++-multilib-version`: https://packages.ubuntu.com/noble/g++-multilib

.. |g++-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`g++-mingw-w64-version`: https://packages.ubuntu.com/noble/g++-mingw-w64

.. |gcc-14-version| replace:: :strong:`v14`
.. _`gcc-14-version`: https://packages.ubuntu.com/noble/gcc-14

.. |gcc-14-multilib-version| replace:: |____| → multilib files
.. _`gcc-14-multilib-version`: https://packages.ubuntu.com/noble/gcc-14-multilib

.. |g++-14-version| replace:: :strong:`v14`
.. _`g++-14-version`: https://packages.ubuntu.com/noble/g++-14

.. |g++-14-multilib-version| replace:: |____| → multilib files
.. _`g++-14-multilib-version`: https://packages.ubuntu.com/noble/g++-14-multilib

.. |gobjc-name| replace:: :strong:`GNU Objective-C compiler`
.. _`gobjc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gobjc

.. |gobjc++-name| replace:: :strong:`GNU Objective-C++ compiler`
.. _`gobjc++-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gobjc%2B%2B

.. |gobjc-10-version| replace:: :strong:`v10.5`
.. _`gobjc-10-version`: https://packages.ubuntu.com/noble/gobjc-10

.. |gobjc-10-multilib-version| replace:: |____| → multilib files
.. _`gobjc-10-multilib-version`: https://packages.ubuntu.com/noble/gobjc-10-multilib

.. |gobjc++-10-version| replace:: :strong:`v10.5`
.. _`gobjc++-10-version`: https://packages.ubuntu.com/noble/gobjc++-10

.. |gobjc++-10-multilib-version| replace:: |____| → multilib files
.. _`gobjc++-10-multilib-version`: https://packages.ubuntu.com/noble/gobjc++-10-multilib

.. |gobjc-11-version| replace:: :strong:`v11.4`
.. _`gobjc-11-version`: https://packages.ubuntu.com/noble/gobjc-11

.. |gobjc-11-multilib-version| replace:: |____| → multilib files
.. _`gobjc-11-multilib-version`: https://packages.ubuntu.com/noble/gobjc-11-multilib

.. |gobjc++-11-version| replace:: :strong:`v11.4`
.. _`gobjc++-11-version`: https://packages.ubuntu.com/noble/gobjc++-11

.. |gobjc++-11-multilib-version| replace:: |____| → multilib files
.. _`gobjc++-11-multilib-version`: https://packages.ubuntu.com/noble/gobjc++-11-multilib

.. |gobjc-12-version| replace:: :strong:`v12.3`
.. _`gobjc-12-version`: https://packages.ubuntu.com/noble/gobjc-12

.. |gobjc-12-multilib-version| replace:: |____| → multilib files
.. _`gobjc-12-multilib-version`: https://packages.ubuntu.com/noble/gobjc-12-multilib

.. |gobjc++-12-version| replace:: :strong:`v12.3`
.. _`gobjc++-12-version`: https://packages.ubuntu.com/noble/gobjc++-12

.. |gobjc++-12-multilib-version| replace:: |____| → multilib files
.. _`gobjc++-12-multilib-version`: https://packages.ubuntu.com/noble/gobjc++-12-multilib

.. |gobjc-version| replace:: :strong:`v13.2`
.. _`gobjc-version`: https://packages.ubuntu.com/noble/gobjc

.. |gobjc-multilib-version| replace:: |____| → multilib files
.. _`gobjc-multilib-version`: https://packages.ubuntu.com/noble/gobjc-multilib

.. |gobjc-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`gobjc-mingw-w64-version`: https://packages.ubuntu.com/noble/gobjc-mingw-w64

.. |gobjc++-version| replace:: :strong:`v13.2`
.. _`gobjc++-version`: https://packages.ubuntu.com/noble/gobjc++

.. |gobjc++-multilib-version| replace:: |____| → multilib files
.. _`gobjc++-multilib-version`: https://packages.ubuntu.com/noble/gobjc++-multilib

.. |gobjc++-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`gobjc++-mingw-w64-version`: https://packages.ubuntu.com/noble/gobjc++-mingw-w64

.. |gobjc-14-version| replace:: :strong:`v14`
.. _`gobjc-14-version`: https://packages.ubuntu.com/noble/gobjc-14

.. |gobjc-14-multilib-version| replace:: |____| → multilib files
.. _`gobjc-14-multilib-version`: https://packages.ubuntu.com/noble/gobjc-14-multilib

.. |gobjc++-14-version| replace:: :strong:`v14`
.. _`gobjc++-14-version`: https://packages.ubuntu.com/noble/gobjc++-14

.. |gobjc++-14-multilib-version| replace:: |____| → multilib files
.. _`gobjc++-14-multilib-version`: https://packages.ubuntu.com/noble/gobjc++-14-multilib

.. csv-table:: Digital Mars D programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|ldc-name|_",                " ", " ", " ", " ", " ", " "
   "x", "|ldc-version|_",             "x", "x", "x", "x", " ", " "
   " ", "|gdc-name|_",                " ", " ", " ", " ", " ", " "
   " ", "|gdc-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gdc-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gdc-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gdc-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gdc-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gdc-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|gdc-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|gdc-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   " ", "|gdc-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gdc-14-multilib-version|_", "x", " ", " ", " ", " ", "x"

.. [*] Default version.

.. |ldc-name| replace:: :strong:`LLVM D compiler`
.. _`ldc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=ldc

.. |ldc-version| replace:: :strong:`v1.36`
.. _`ldc-version`: https://packages.ubuntu.com/noble/ldc

.. |gdc-name| replace:: :strong:`GNU D compiler`
.. _`gdc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gdc

.. |gdc-10-version| replace:: :strong:`v10.5`
.. _`gdc-10-version`: https://packages.ubuntu.com/noble/gdc-10

.. |gdc-10-multilib-version| replace:: |____| → multilib files
.. _`gdc-10-multilib-version`: https://packages.ubuntu.com/noble/gdc-10-multilib

.. |gdc-11-version| replace:: :strong:`v11.4`
.. _`gdc-11-version`: https://packages.ubuntu.com/noble/gdc-11

.. |gdc-11-multilib-version| replace:: |____| → multilib files
.. _`gdc-11-multilib-version`: https://packages.ubuntu.com/noble/gdc-11-multilib

.. |gdc-12-version| replace:: :strong:`v12.3`
.. _`gdc-12-version`: https://packages.ubuntu.com/noble/gdc-12

.. |gdc-12-multilib-version| replace:: |____| → multilib files
.. _`gdc-12-multilib-version`: https://packages.ubuntu.com/noble/gdc-12-multilib

.. |gdc-version| replace:: :strong:`v13.2`
.. _`gdc-version`: https://packages.ubuntu.com/noble/gdc

.. |gdc-multilib-version| replace:: |____| → multilib files
.. _`gdc-multilib-version`: https://packages.ubuntu.com/noble/gdc-multilib

.. |gdc-14-version| replace:: :strong:`v14`
.. _`gdc-14-version`: https://packages.ubuntu.com/noble/gdc-14

.. |gdc-14-multilib-version| replace:: |____| → multilib files
.. _`gdc-14-multilib-version`: https://packages.ubuntu.com/noble/gdc-14-multilib

.. csv-table:: Go programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|golang-go-name|_",            " ", " ", " ", " ", " ", " "
   " ", "|golang-1.21-go-version|_",    "x", "x", "x", "x", "x", "x"
   "x", "|golang-go-version|_",         "x", "x", "x", "x", "x", "x"
   " ", "|golang-1.23-go-version|_",    "x", "x", "x", "x", "x", "x"
   " ", "|gccgo-name|_",                " ", " ", " ", " ", " ", " "
   " ", "|gccgo-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gccgo-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gccgo-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gccgo-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gccgo-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gccgo-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|gccgo-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|gccgo-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   " ", "|gccgo-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gccgo-14-multilib-version|_", "x", " ", " ", " ", " ", "x"

.. [*] Default version.

.. |golang-go-name| replace:: :strong:`Golang Go compiler`
.. _`golang-go-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=golang-go

.. |golang-1.21-go-version| replace:: :strong:`v1.21`
.. _`golang-1.21-go-version`: https://packages.ubuntu.com/noble/golang-1.21-go

.. |golang-go-version| replace:: :strong:`v1.22`
.. _`golang-go-version`: https://packages.ubuntu.com/noble/golang-go

.. |golang-1.23-go-version| replace:: :strong:`v1.23`
.. _`golang-1.23-go-version`: https://packages.ubuntu.com/noble-updates/golang-1.23-go

.. |gccgo-name| replace:: :strong:`GNU Go compiler`
.. _`gccgo-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gccgo

.. |gccgo-10-version| replace:: :strong:`v10.5`
.. _`gccgo-10-version`: https://packages.ubuntu.com/noble/gccgo-10

.. |gccgo-10-multilib-version| replace:: |____| → multilib files
.. _`gccgo-10-multilib-version`: https://packages.ubuntu.com/noble/gccgo-10-multilib

.. |gccgo-11-version| replace:: :strong:`v11.4`
.. _`gccgo-11-version`: https://packages.ubuntu.com/noble/gccgo-11

.. |gccgo-11-multilib-version| replace:: |____| → multilib files
.. _`gccgo-11-multilib-version`: https://packages.ubuntu.com/noble/gccgo-11-multilib

.. |gccgo-12-version| replace:: :strong:`v12.3`
.. _`gccgo-12-version`: https://packages.ubuntu.com/noble/gccgo-12

.. |gccgo-12-multilib-version| replace:: |____| → multilib files
.. _`gccgo-12-multilib-version`: https://packages.ubuntu.com/noble/gccgo-12-multilib

.. |gccgo-version| replace:: :strong:`v13.2`
.. _`gccgo-version`: https://packages.ubuntu.com/noble/gccgo

.. |gccgo-multilib-version| replace:: |____| → multilib files
.. _`gccgo-multilib-version`: https://packages.ubuntu.com/noble/gccgo-multilib

.. |gccgo-14-version| replace:: :strong:`v14`
.. _`gccgo-14-version`: https://packages.ubuntu.com/noble/gccgo-14

.. |gccgo-14-multilib-version| replace:: |____| → multilib files
.. _`gccgo-14-multilib-version`: https://packages.ubuntu.com/noble/gccgo-14-multilib

.. csv-table:: Fortran 95 / 2018 programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|flang-name|_",                   " ", " ", " ", " ", " ", " "
   " ", "|flang-15-version|_",             "x", " ", "x", "x", "x", " "
   " ", "|flang-16-version|_",             "x", " ", "x", "x", "x", " "
   " ", "|flang-17-version|_",             "x", " ", "x", "x", "x", " "
   "x", "|flang-version|_",                "x", " ", "x", "x", "x", " "
   " ", "|lfortran-name|_",                " ", " ", " ", " ", " ", " "
   "x", "|lfortran-version|_",             "x", "x", "x", "x", "x", " "
   " ", "|gfortran-name|_ [*]_",           " ", " ", " ", " ", " ", " "
   " ", "|gfortran-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gfortran-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gfortran-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gfortran-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gfortran-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gfortran-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|gfortran-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|gfortran-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   "x", "|gfortran-mingw-w64-version|_",   "x", "x", "x", "x", "x", "x"
   " ", "|gfortran-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gfortran-14-multilib-version|_", "x", " ", " ", " ", " ", "x"

.. [*] Default version.
.. [*] .. note:: compatible to **GNU Fortran 77** too: ``gfortran -std=legacy``

.. |flang-name| replace:: :strong:`Flang compiler`
.. _`flang-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=flang

.. |flang-15-version| replace:: :strong:`v15.0.7`
.. _`flang-15-version`: https://packages.ubuntu.com/noble/flang-15

.. |flang-16-version| replace:: :strong:`v16.0.6`
.. _`flang-16-version`: https://packages.ubuntu.com/noble/flang-16

.. |flang-17-version| replace:: :strong:`v17.0.6`
.. _`flang-17-version`: https://packages.ubuntu.com/noble/flang-17

.. |flang-version| replace:: :strong:`v18.1.3`
.. _`flang-version`: https://packages.ubuntu.com/noble/flang

.. |lfortran-name| replace:: :strong:`LFortran compiler`
.. _`lfortran-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=lfortran

.. |lfortran-version| replace:: :strong:`v0.30` (ALPHA)
.. _`lfortran-version`: https://packages.ubuntu.com/noble/lfortran

.. |gfortran-name| replace:: :strong:`GNU Fortran 95 compiler`
.. _`gfortran-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gfortran

.. |gfortran-10-version| replace:: :strong:`v10.5`
.. _`gfortran-10-version`: https://packages.ubuntu.com/noble/gfortran-10

.. |gfortran-10-multilib-version| replace:: |____| → multilib files
.. _`gfortran-10-multilib-version`: https://packages.ubuntu.com/noble/gfortran-10-multilib

.. |gfortran-11-version| replace:: :strong:`v11.4`
.. _`gfortran-11-version`: https://packages.ubuntu.com/noble/gfortran-11

.. |gfortran-11-multilib-version| replace:: |____| → multilib files
.. _`gfortran-11-multilib-version`: https://packages.ubuntu.com/noble/gfortran-11-multilib

.. |gfortran-12-version| replace:: :strong:`v12.3`
.. _`gfortran-12-version`: https://packages.ubuntu.com/noble/gfortran-12

.. |gfortran-12-multilib-version| replace:: |____| → multilib files
.. _`gfortran-12-multilib-version`: https://packages.ubuntu.com/noble/gfortran-12-multilib

.. |gfortran-version| replace:: :strong:`v13.2`
.. _`gfortran-version`: https://packages.ubuntu.com/noble/gfortran

.. |gfortran-multilib-version| replace:: |____| → multilib files
.. _`gfortran-multilib-version`: https://packages.ubuntu.com/noble/gfortran-multilib

.. |gfortran-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`gfortran-mingw-w64-version`: https://packages.ubuntu.com/noble/gfortran-mingw-w64

.. |gfortran-14-version| replace:: :strong:`v14`
.. _`gfortran-14-version`: https://packages.ubuntu.com/noble/gfortran-14

.. |gfortran-14-multilib-version| replace:: |____| → multilib files
.. _`gfortran-14-multilib-version`: https://packages.ubuntu.com/noble/gfortran-14-multilib

.. csv-table:: Modula-2 programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|gm2-name|_",       " ", " ", " ", " ", " ", " "
   " ", "|gm2-10-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|gm2-11-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|gm2-12-version|_", "x", "x", "x", "x", "x", "x"
   "x", "|gm2-version|_",    "x", "x", "x", "x", "x", "x"
   " ", "|gm2-14-version|_", "x", "x", "x", "x", "x", "x"

.. [*] Default version.

.. |gm2-name| replace:: :strong:`GNU Modula-2 compiler`
.. _`gm2-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gm2

.. |gm2-10-version| replace:: :strong:`v10.5`
.. _`gm2-10-version`: https://packages.ubuntu.com/noble/gm2-10

.. |gm2-11-version| replace:: :strong:`v11.4`
.. _`gm2-11-version`: https://packages.ubuntu.com/noble/gm2-11

.. |gm2-12-version| replace:: :strong:`v12.3`
.. _`gm2-12-version`: https://packages.ubuntu.com/noble/gm2-12

.. |gm2-version| replace:: :strong:`v13.2`
.. _`gm2-version`: https://packages.ubuntu.com/noble/gm2

.. |gm2-14-version| replace:: :strong:`v14`
.. _`gm2-14-version`: https://packages.ubuntu.com/noble/gm2-14

.. csv-table:: Ada programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|gnat-name|_ [*]_",         " ", " ", " ", " ", " ", " "
   " ", "|gnat-10-version|_",        " ", " ", " ", " ", " ", " "
   " ", "|gnat-11-version|_",        " ", " ", " ", " ", " ", " "
   " ", "|gnat-12-version|_",        " ", " ", " ", " ", " ", " "
   "x", "|gnat-version|_",           "x", "x", "x", "x", "x", "x"
   "x", "|gnat-mingw-w64-version|_", "x", "x", "x", "x", "x", "x"
   " ", "|gnat-14-version|_",        " ", " ", " ", " ", " ", " "

.. [*] Default version.
.. [*] .. note:: multiple version installation not possible

.. |gnat-name| replace:: :strong:`GNU Ada compiler`
.. _`gnat-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gnat

.. |gnat-10-version| replace:: :strong:`v10.5`
.. _`gnat-10-version`: https://packages.ubuntu.com/noble/gnat-10

.. |gnat-11-version| replace:: :strong:`v11.4`
.. _`gnat-11-version`: https://packages.ubuntu.com/noble/gnat-11

.. |gnat-12-version| replace:: :strong:`v12.3`
.. _`gnat-12-version`: https://packages.ubuntu.com/noble/gnat-12

.. |gnat-version| replace:: :strong:`v13.2`
.. _`gnat-version`: https://packages.ubuntu.com/noble/gnat

.. |gnat-mingw-w64-version| replace:: |____| → for MinGW-w64
.. _`gnat-mingw-w64-version`: https://packages.ubuntu.com/noble/gnat-mingw-w64

.. |gnat-14-version| replace:: :strong:`v14`
.. _`gnat-14-version`: https://packages.ubuntu.com/noble/gnat-14

.. csv-table:: COBOL programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5

   " ", "|gnucobol-name|_ [*]_", " ", " ", " ", " ", " ", " "
   "x", "|gnucobol-version|_",   "x", "x", "x", "x", "x", "x"
   " ", "|gnucobol4-version|_",  " ", " ", " ", " ", " ", " "

.. [*] Default version.
.. [*] .. note:: multiple version installation not possible

.. |gnucobol-name| replace:: :strong:`GNU COBOL (OpenCOBOL) compiler`
.. _`gnucobol-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gnucobol

.. |gnucobol-version| replace:: :strong:`v3.1.2`
.. _`gnucobol-version`: https://packages.ubuntu.com/noble/gnucobol

.. |gnucobol4-version| replace:: :strong:`v4.0` (TESTING)
.. _`gnucobol4-version`: https://packages.ubuntu.com/noble/gnucobol4

.. csv-table:: Forth programming
   :header: "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 70 5 5 5 5 5 5

   "|gforth-name|_",    " ", " ", " ", " ", " ", " "
   "|gforth-version|_", "x", "x", "x", "x", "x", "x"

.. |gforth-name| replace:: :strong:`GNU Forth Language Environment`
.. _`gforth-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gforth

.. |gforth-version| replace:: :strong:`v0.7.3`
.. _`gforth-version`: https://packages.ubuntu.com/noble/gforth

.. csv-table:: Pascal programming
   :header: "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 70 5 5 5 5 5 5

   "|fp-name|_",                         " ", " ", " ", " ", " ", " "
   "|fp-compiler-version|_",             "x", "x", "x", " ", "x", " "
   "|fp-utils-version|_",                "x", "x", "x", " ", "x", " "
   "|fp-units-base-version|_",           "x", "x", "x", " ", "x", " "
   "|fp-units-db-version|_",             "x", "x", "x", " ", "x", " "
   "|fp-units-fcl-version|_",            "x", "x", "x", " ", "x", " "
   "|fp-units-fv-version|_",             "x", "x", "x", " ", "x", " "
   "|fp-units-gfx-version|_",            "x", "x", "x", " ", "x", " "
   "|fp-units-gtk2-version|_",           "x", "x", "x", " ", "x", " "
   "|fp-units-math-version|_",           "x", "x", "x", " ", "x", " "
   "|fp-units-misc-version|_",           "x", "x", "x", " ", "x", " "
   "|fp-units-multimedia-version|_",     "x", "x", "x", " ", "x", " "
   "|fp-units-net-version|_",            "x", "x", "x", " ", "x", " "
   "|fp-units-wasm-version|_",           "x", "x", "x", " ", "x", " "
   "|fp-units-win-base-version|_",       "x", " ", " ", " ", " ", " "
   "|fp-units-win-db-version|_",         "x", " ", " ", " ", " ", " "
   "|fp-units-win-fcl-version|_",        "x", " ", " ", " ", " ", " "
   "|fp-units-win-fv-version|_",         "x", " ", " ", " ", " ", " "
   "|fp-units-win-gfx-version|_",        "x", " ", " ", " ", " ", " "
   "|fp-units-win-gtk2-version|_",       "x", " ", " ", " ", " ", " "
   "|fp-units-win-math-version|_",       "x", " ", " ", " ", " ", " "
   "|fp-units-win-misc-version|_",       "x", " ", " ", " ", " ", " "
   "|fp-units-win-multimedia-version|_", "x", " ", " ", " ", " ", " "
   "|fp-units-win-net-version|_",        "x", " ", " ", " ", " ", " "
   "|fp-units-win-wasm-version|_",       "x", " ", " ", " ", " ", " "
   "|pasdoc-name|_",                     " ", " ", " ", " ", " ", " "
   "|pasdoc-version|_",                  "x", "x", "x", " ", "x", " "

.. |fp-name| replace:: :strong:`Free Pascal compiler`
.. _`fp-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=fp

.. |fp-compiler-version| replace:: :strong:`v3.2.2`
.. _`fp-compiler-version`: https://packages.ubuntu.com/noble/fp-compiler

.. |fp-utils-version| replace:: |____| → utilities
.. _`fp-utils-version`: https://packages.ubuntu.com/noble/fp-utils

.. |fp-units-base-version| replace:: |____| → Base units
.. _`fp-units-base-version`: https://packages.ubuntu.com/noble/fp-units-base

.. |fp-units-db-version| replace:: |____| → Database units
.. _`fp-units-db-version`: https://packages.ubuntu.com/noble/fp-units-db

.. |fp-units-fcl-version| replace:: |____| → Free Component units
.. _`fp-units-fcl-version`: https://packages.ubuntu.com/noble/fp-units-fcl

.. |fp-units-fv-version| replace:: |____| → Free Vision units
.. _`fp-units-fv-version`: https://packages.ubuntu.com/noble/fp-units-fv

.. |fp-units-gfx-version| replace:: |____| → Graphics units
.. _`fp-units-gfx-version`: https://packages.ubuntu.com/noble/fp-units-gfx

.. |fp-units-gtk2-version| replace:: |____| → GTK+ 2.x units
.. _`fp-units-gtk2-version`: https://packages.ubuntu.com/noble/fp-units-gtk2

.. |fp-units-math-version| replace:: |____| → Mathematics units
.. _`fp-units-math-version`: https://packages.ubuntu.com/noble/fp-units-math

.. |fp-units-misc-version| replace:: |____| → Miscellaneous units
.. _`fp-units-misc-version`: https://packages.ubuntu.com/noble/fp-units-misc

.. |fp-units-multimedia-version| replace:: |____| → Multimedia units
.. _`fp-units-multimedia-version`: https://packages.ubuntu.com/noble/fp-units-multimedia

.. |fp-units-net-version| replace:: |____| → Networking units
.. _`fp-units-net-version`: https://packages.ubuntu.com/noble/fp-units-net

.. |fp-units-wasm-version| replace:: |____| → WebAssembly support units
.. _`fp-units-wasm-version`: https://packages.ubuntu.com/noble/fp-units-wasm

.. |fp-units-win-base-version| replace:: |____| → ``x86_64-win64``: Base units
.. _`fp-units-win-base-version`: https://packages.ubuntu.com/noble/fp-units-win-base

.. |fp-units-win-db-version| replace:: |____| → ``x86_64-win64``: Database units
.. _`fp-units-win-db-version`: https://packages.ubuntu.com/noble/fp-units-win-db

.. |fp-units-win-fcl-version| replace:: |____| → ``x86_64-win64``: Free Component units
.. _`fp-units-win-fcl-version`: https://packages.ubuntu.com/noble/fp-units-win-fcl

.. |fp-units-win-fv-version| replace:: |____| → ``x86_64-win64``: Free Vision units
.. _`fp-units-win-fv-version`: https://packages.ubuntu.com/noble/fp-units-win-fv

.. |fp-units-win-gfx-version| replace:: |____| → ``x86_64-win64``: Graphics units
.. _`fp-units-win-gfx-version`: https://packages.ubuntu.com/noble/fp-units-win-gfx

.. |fp-units-win-gtk2-version| replace:: |____| → ``x86_64-win64``: GTK+ 2.x units
.. _`fp-units-win-gtk2-version`: https://packages.ubuntu.com/noble/fp-units-win-gtk2

.. |fp-units-win-math-version| replace:: |____| → ``x86_64-win64``: Mathematics units
.. _`fp-units-win-math-version`: https://packages.ubuntu.com/noble/fp-units-win-math

.. |fp-units-win-misc-version| replace:: |____| → ``x86_64-win64``: Miscellaneous units
.. _`fp-units-win-misc-version`: https://packages.ubuntu.com/noble/fp-units-win-misc

.. |fp-units-win-multimedia-version| replace:: |____| → ``x86_64-win64``: Multimedia units
.. _`fp-units-win-multimedia-version`: https://packages.ubuntu.com/noble/fp-units-win-multimedia

.. |fp-units-win-net-version| replace:: |____| → ``x86_64-win64``: Networking units
.. _`fp-units-win-net-version`: https://packages.ubuntu.com/noble/fp-units-win-net

.. |fp-units-win-wasm-version| replace:: |____| → ``x86_64-win64``: WebAssembly support units
.. _`fp-units-win-wasm-version`: https://packages.ubuntu.com/noble/fp-units-win-wasm

.. |pasdoc-name| replace:: :strong:`Pascal source code documentation`
.. _`pasdoc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=pasdoc

.. |pasdoc-version| replace:: :strong:`v0.16.0`
.. _`pasdoc-version`: https://packages.ubuntu.com/noble/pasdoc

.. csv-table:: Scheme/Lisp programming
   :header: "Interpreter/Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 70 5 5 5 5 5 5

   "|gambc-name|_",             " ", " ", " ", " ", " ", " "
   "|gambc-version|_",          "x", "x", "x", "x", "x", "x"
   "|guile-name|_",             " ", " ", " ", " ", " ", " "
   "|guile-2.2-version|_",      "x", "x", "x", "x", "x", "x"
   "|guile-3.0-version|_ [*]_", "x", "x", "x", "x", "x", "x"

.. [*] with `JIT`_ compilation

.. |gambc-name| replace:: :strong:`Gambit interpreter and compiler`
.. _`gambc-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=gambc

.. |gambc-version| replace:: :strong:`v4.9.3`
.. _`gambc-version`: https://packages.ubuntu.com/noble/gambc

.. |guile-name| replace:: :strong:`GNU Guile interpreter and compiler`
.. _`guile-name`: https://packages.ubuntu.com/search?suite=noble&section=all&searchon=names&keywords=guile

.. |guile-2.2-version| replace:: :strong:`v2.2`
.. _`guile-2.2-version`: https://packages.ubuntu.com/noble/guile-2.2

.. |guile-3.0-version| replace:: :strong:`v3.0`
.. _`guile-3.0-version`: https://packages.ubuntu.com/noble/guile-3.0

.. csv-table:: Meta programming
   :header: "Tools", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 70 5 5 5 5 5 5

   "|bison-version|_ [Y]_",        "x", "x", "x", "x", "x", "x"
   "|byacc-version|_ [L]_/ [Y]_",  "x", "x", "x", "x", "x", "x"
   "|btyacc-version|_ [L]_/ [Y]_", "x", "x", "x", "x", "x", "x"
   "|nyacc-version|_ [Y]_",        "x", "x", "x", "x", "x", "x"
   "|flex-version|_",              "x", "x", "x", "x", "x", "x"
   "|re2c-version|_ [T]_",         "x", "x", "x", "x", "x", "x"
   "|m4-version|_",                "x", "x", "x", "x", "x", "x"

.. [L] with `Look-Ahead, Left-to-Right <LALR_>`_ support
.. [T] with `Look-Ahead, Tagged Deterministic Finite Automaton <TDFA_>`_ support
.. [Y] with `Yet Another Compiler-Compiler <YACC_>`_ support

.. |bison-version| replace:: GNU Bison YACC parser generator :strong:`v3.8.2`
.. _`bison-version`: https://packages.ubuntu.com/noble/bison

.. |byacc-version| replace:: Berkeley LALR/YACC parser generator :strong:`v2.0`
.. _`byacc-version`: https://packages.ubuntu.com/noble/byacc

.. |btyacc-version| replace:: Backtracking Berkeley LALR/YACC parser generator :strong:`v3.0`
.. _`btyacc-version`: https://packages.ubuntu.com/noble/btyacc

.. |nyacc-version| replace:: Not Yet Another Compiler Compiler (YACC) :strong:`v1.00`
.. _`nyacc-version`: https://packages.ubuntu.com/noble/nyacc

.. |flex-version| replace:: Fast LEXical analyzer generator :strong:`v2.6.4`
.. _`flex-version`: https://packages.ubuntu.com/noble/flex

.. |re2c-version| replace:: Lexer generator for C/C++, Go and Rust :strong:`v3.1`
.. _`re2c-version`: https://packages.ubuntu.com/noble/re2c

.. |m4-version| replace:: M4 macro processing language :strong:`v1.4.19`
.. _`m4-version`: https://packages.ubuntu.com/noble/m4

.. References
.. ----------

.. .. target-notes::

.. unicode replacements:

.. |_| unicode:: 0xA0
   :trim:

.. |__| unicode:: 0xA0 0xA0
   :trim:

.. |___| unicode:: 0xA0 0xA0 0xA0
   :trim:

.. |____| unicode:: 0xA0 0xA0 0xA0 0xA0
   :trim:
