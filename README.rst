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
