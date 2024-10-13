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

.. csv-table:: C/C++ and Objective-C/C++ programming
   :header: "[*]_", "Compiler", "``amd64``", "``arm/v7``", "``arm64/v8``", "``riscv64``", "``ppc64le``", "``s390x``"
   :widths: 5 65 5 5 5 5 5 5
   :stub-columns: 1

   " ", "|gcc-name|_",                " ", " ", " ", " ", " ", " "
   " ", "|gcc-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gcc-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gcc-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gcc-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|gcc-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gcc-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|gcc-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|gcc-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   "x", "|gcc-mingw-w64-version|_",   "x", "x", "x", "x", "x", "x"
   " ", "|gcc-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|gcc-14-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|g++-name|_",                " ", " ", " ", " ", " ", " "
   " ", "|g++-10-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|g++-10-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|g++-11-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|g++-11-multilib-version|_", "x", " ", " ", " ", " ", "x"
   " ", "|g++-12-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|g++-12-multilib-version|_", "x", " ", " ", " ", " ", "x"
   "x", "|g++-version|_",             "x", "x", "x", "x", "x", "x"
   "x", "|g++-multilib-version|_",    "x", " ", " ", " ", " ", "x"
   "x", "|g++-mingw-w64-version|_",   "x", "x", "x", "x", "x", "x"
   " ", "|g++-14-version|_",          "x", "x", "x", "x", "x", "x"
   " ", "|g++-14-multilib-version|_", "x", " ", " ", " ", " ", "x"

.. [*] Default version.

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
