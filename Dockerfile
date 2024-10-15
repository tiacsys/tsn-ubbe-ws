# syntax=docker/dockerfile:1
#
# TiaC Systems Network - Ubuntu Build Essentials Workspace
#
#  -- derived from TSN ASDF Workspace Docker image
#  -- see: https://github.com/tiacsys/tsn-asdf-ws/pkgs/container/tsn-asdf-ws
#  -- see: https://github.com/tiacsys/tsn-asdf-ws
#
#  -- support Docker multi-platform image build
#  -- see: https://docs.docker.com/build/building/multi-platform
#  -- see: https://docs.docker.com/build/building/variables/#multi-platform-build-arguments
#
#  -- TARGETPLATFORM=linux/amd64: TARGETOS=linux, TARGETARCH=amd64, TARGETVARIANT=
#  -- TARGETPLATFORM=linux/arm/v7: TARGETOS=linux, TARGETARCH=arm, TARGETVARIANT=v7
#  -- TARGETPLATFORM=linux/arm64/v8: TARGETOS=linux, TARGETARCH=arm64, TARGETVARIANT=v8
#  -- TARGETPLATFORM=linux/riscv64: TARGETOS=linux, TARGETARCH=riscv64, TARGETVARIANT=
#  -- TARGETPLATFORM=linux/ppc64le: TARGETOS=linux, TARGETARCH=ppc64le, TARGETVARIANT=
#  -- TARGETPLATFORM=linux/s390x: TARGETOS=linux, TARGETARCH=s390x, TARGETVARIANT=
#
#  -- https://patorjk.com/software/taag/#p=display&c=bash&f=Tmplr&t=ALL
#  -- https://patorjk.com/software/taag/#p=display&c=bash&f=Tmplr&t=FINAL
#  -- https://patorjk.com/software/taag/#p=display&c=bash&f=Tmplr&t=SYS
#  -- https://patorjk.com/software/taag/#p=display&c=bash&f=Big%20Chief&t=Section
#


#  -- about 10 minutes
#  ___________________________
#      ____
#      /   )
#  ---/__ /-----__---__----__-
#    /    )   /   ) (_ ` /___)
#  _/____/___(___(_(__)_(___ _
#
#

# ############################################################################
#                                                                     ┏┓┓┏┏┓
#   System maintenance with TSN ASDF Workspace Docker image           ┗┓┗┫┗┓
#                                                                     ┗┛┗┛┗┛
# ############################################################################

FROM ghcr.io/tiacsys/tsn-asdf-ws:2024.10.1 AS base

# overwrite Ubuntu default metadata
LABEL mantainer="Stephan Linz <stephan.linz@tiac-systems.de>"
LABEL version="unstable"

# ############################################################################

# workspace user definitions (copied from tiacsys/tsn-asdf-ws Dockerfile)
ARG WSUSER_HOME=/home/tsn
ARG WSUSER_NAME=tsn

# ############################################################################

# switch to superuser
USER root
WORKDIR /

# ############################################################################

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes dist-upgrade \
 && apt-get --assume-yes install --no-install-recommends \
    build-essential \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# All architectures maintenance for Low-Level Virtual Machine (LLVM)
#
# ############################################################################

FROM base AS llvm-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    llvm-14-dev \
    llvm-15-dev \
    llvm-16-dev \
    llvm-17-dev \
    lld-17 \
    llvm-dev \
    lld \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for Low-Level Virtual Machine (LLVM)
#
# ############################################################################

FROM llvm-all AS llvm

# ############################################################################
#
# All architectures maintenance for LLVM C/C++ and Objective-C compiler
#
# ############################################################################

FROM llvm AS clang-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    clang-14 \
    clang-format-14 \
    clang-tools-14 \
    clang-tidy-14 \
    clang-15 \
    clang-format-15 \
    clang-tools-15 \
    clang-tidy-15 \
    clang-16 \
    clang-format-16 \
    clang-tools-16 \
    clang-tidy-16 \
    clang-17 \
    clang-format-17 \
    clang-tools-17 \
    clang-tidy-17 \
    clang \
    clang-format \
    clang-tools \
    clang-tidy \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for LLVM C/C++ and Objective-C compiler
#
# ############################################################################

FROM clang-all AS clang

# ############################################################################
#
# All architectures maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM clang AS flang-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    flang-15 \
    flang-16 \
    flang-17 \
    flang \
    lfortran \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    lfortran \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    flang-15 \
    flang-16 \
    flang-17 \
    flang \
    lfortran \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    flang-15 \
    flang-16 \
    flang-17 \
    flang \
    lfortran \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    flang-15 \
    flang-16 \
    flang-17 \
    flang \
    lfortran \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-all AS flang-s390x

# ############################################################################
#
# Final maintenance for LLVM Fortran 95 / 2018 compiler
#
# ############################################################################

FROM flang-${TARGETARCH} AS flang

# ############################################################################
#
# All architectures maintenance for LLVM D compiler
#
# ############################################################################

FROM flang AS ldc-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    ldc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    ldc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    ldc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    ldc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-ppc64le

# ############################################################################
#
# IBM z-Systems architecture maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-all AS ldc-s390x

# ############################################################################
#
# Final maintenance for LLVM D compiler
#
# ############################################################################

FROM ldc-${TARGETARCH} AS ldc

# ############################################################################
#
# All architectures maintenance for GNU C/C++ compiler
#
# ############################################################################

FROM ldc AS gcc-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for GNU C/C++ compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#   - Win64/Win32
#
# ############################################################################

FROM gcc-all AS gcc-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    gcc-10-multilib \
    g++-10 \
    g++-10-multilib \
    gcc-11 \
    gcc-11-multilib \
    g++-11 \
    g++-11-multilib \
    gcc-12 \
    gcc-12-multilib \
    g++-12 \
    g++-12-multilib \
    gcc \
    gcc-mingw-w64 \
    gcc-multilib \
    g++ \
    g++-mingw-w64 \
    g++-multilib \
    cpp-14 \
    gcc-14 \
    gcc-14-multilib \
    g++-14 \
    g++-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for GNU C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gcc-all AS gcc-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    g++-10 \
    gcc-11 \
    g++-11 \
    gcc-12 \
    g++-12 \
    gcc \
    gcc-mingw-w64 \
    g++ \
    g++-mingw-w64 \
    cpp-14 \
    gcc-14 \
    g++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for GNU C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gcc-all AS gcc-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    g++-10 \
    gcc-11 \
    g++-11 \
    gcc-12 \
    g++-12 \
    gcc \
    gcc-mingw-w64 \
    g++ \
    g++-mingw-w64 \
    cpp-14 \
    gcc-14 \
    g++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for GNU C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gcc-all AS gcc-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    g++-10 \
    gcc-11 \
    g++-11 \
    gcc-12 \
    g++-12 \
    gcc \
    gcc-mingw-w64 \
    g++ \
    g++-mingw-w64 \
    cpp-14 \
    gcc-14 \
    g++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for GNU C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gcc-all AS gcc-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    g++-10 \
    gcc-11 \
    g++-11 \
    gcc-12 \
    g++-12 \
    gcc \
    gcc-mingw-w64 \
    g++ \
    g++-mingw-w64 \
    cpp-14 \
    gcc-14 \
    g++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for GNU C/C++ compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gcc-all AS gcc-s390x

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gcc-10 \
    gcc-10-multilib \
    g++-10 \
    g++-10-multilib \
    gcc-11 \
    gcc-11-multilib \
    g++-11 \
    g++-11-multilib \
    gcc-12 \
    gcc-12-multilib \
    g++-12 \
    g++-12-multilib \
    gcc \
    gcc-mingw-w64 \
    gcc-multilib \
    g++ \
    g++-mingw-w64 \
    g++-multilib \
    cpp-14 \
    gcc-14 \
    gcc-14-multilib \
    g++-14 \
    g++-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU C/C++ compiler
#
# ############################################################################

FROM gcc-${TARGETARCH} AS gcc

# ############################################################################
#
# All architectures maintenance for GNU Objective-C/C++ compiler
#
# ############################################################################

FROM gcc AS gobjc-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for GNU Objective-C/C++ compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc-10-multilib \
    gobjc++-10 \
    gobjc++-10-multilib \
    gobjc-11 \
    gobjc-11-multilib \
    gobjc++-11 \
    gobjc++-11-multilib \
    gobjc-12 \
    gobjc-12-multilib \
    gobjc++-12 \
    gobjc++-12-multilib \
    gobjc \
    gobjc-mingw-w64 \
    gobjc-multilib \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc++-multilib \
    gobjc-14 \
    gobjc-14-multilib \
    gobjc++-14 \
    gobjc++-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for GNU Objective-C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc++-10 \
    gobjc-11 \
    gobjc++-11 \
    gobjc-12 \
    gobjc++-12 \
    gobjc \
    gobjc-mingw-w64 \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc-14 \
    gobjc++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for GNU Objective-C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc++-10 \
    gobjc-11 \
    gobjc++-11 \
    gobjc-12 \
    gobjc++-12 \
    gobjc \
    gobjc-mingw-w64 \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc-14 \
    gobjc++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for GNU Objective-C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc++-10 \
    gobjc-11 \
    gobjc++-11 \
    gobjc-12 \
    gobjc++-12 \
    gobjc \
    gobjc-mingw-w64 \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc-14 \
    gobjc++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for GNU Objective-C/C++ compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc++-10 \
    gobjc-11 \
    gobjc++-11 \
    gobjc-12 \
    gobjc++-12 \
    gobjc \
    gobjc-mingw-w64 \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc-14 \
    gobjc++-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for GNU Objective-C/C++ compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gobjc-all AS gobjc-s390x

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gobjc-10 \
    gobjc-10-multilib \
    gobjc++-10 \
    gobjc++-10-multilib \
    gobjc-11 \
    gobjc-11-multilib \
    gobjc++-11 \
    gobjc++-11-multilib \
    gobjc-12 \
    gobjc-12-multilib \
    gobjc++-12 \
    gobjc++-12-multilib \
    gobjc \
    gobjc-mingw-w64 \
    gobjc-multilib \
    gobjc++ \
    gobjc++-mingw-w64 \
    gobjc++-multilib \
    gobjc-14 \
    gobjc-14-multilib \
    gobjc++-14 \
    gobjc++-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU Objective-C/C++ compiler
#
# ############################################################################

FROM gobjc-${TARGETARCH} AS gobjc

# ############################################################################
#
# All architectures maintenance for GNU D compiler
#
# ############################################################################

FROM gobjc AS gdc-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for GNU D compiler (multilib)
#
# ############################################################################

FROM gdc-all AS gdc-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-10-multilib \
    gdc-11 \
    gdc-11-multilib \
    gdc-12 \
    gdc-12-multilib \
    gdc \
    gdc-multilib \
    gdc-14 \
    gdc-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for GNU D compiler
#
# ############################################################################

FROM gdc-all AS gdc-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-11 \
    gdc-12 \
    gdc \
    gdc-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for GNU D compiler
#
# ############################################################################

FROM gdc-all AS gdc-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-11 \
    gdc-12 \
    gdc \
    gdc-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for GNU D compiler
#
# ############################################################################

FROM gdc-all AS gdc-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-11 \
    gdc-12 \
    gdc \
    gdc-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for GNU D compiler
#
# ############################################################################

FROM gdc-all AS gdc-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-11 \
    gdc-12 \
    gdc \
    gdc-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for GNU D compiler (multilib)
#
# ############################################################################

FROM gdc-all AS gdc-s390x

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gdc-10 \
    gdc-10-multilib \
    gdc-11 \
    gdc-11-multilib \
    gdc-12 \
    gdc-12-multilib \
    gdc \
    gdc-multilib \
    gdc-14 \
    gdc-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU D compiler
#
# ############################################################################

FROM gdc-${TARGETARCH} AS gdc

# ############################################################################
#
# All architectures maintenance for GNU Go compiler
#
# ############################################################################

FROM gdc AS gccgo-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for GNU Go compiler (multilib)
#
# ############################################################################

FROM gccgo-all AS gccgo-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-10-multilib \
    gccgo-11 \
    gccgo-11-multilib \
    gccgo-12 \
    gccgo-12-multilib \
    gccgo \
    gccgo-multilib \
    gccgo-14 \
    gccgo-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for GNU Go compiler
#
# ############################################################################

FROM gccgo-all AS gccgo-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-11 \
    gccgo-12 \
    gccgo \
    gccgo-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for GNU Go compiler
#
# ############################################################################

FROM gccgo-all AS gccgo-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-11 \
    gccgo-12 \
    gccgo \
    gccgo-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for GNU Go compiler
#
# ############################################################################

FROM gccgo-all AS gccgo-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-11 \
    gccgo-12 \
    gccgo \
    gccgo-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for GNU Go compiler
#
# ############################################################################

FROM gccgo-all AS gccgo-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-11 \
    gccgo-12 \
    gccgo \
    gccgo-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for GNU Go compiler (multilib)
#
# ############################################################################

FROM gccgo-all AS gccgo-s390x

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gccgo-10 \
    gccgo-10-multilib \
    gccgo-11 \
    gccgo-11-multilib \
    gccgo-12 \
    gccgo-12-multilib \
    gccgo \
    gccgo-multilib \
    gccgo-14 \
    gccgo-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU Go compiler
#
# ############################################################################

FROM gccgo-${TARGETARCH} AS gccgo

# ############################################################################
#
# All architectures maintenance for GNU Fortran 95 compiler
#
# ############################################################################

FROM gccgo AS gfortran-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for GNU Fortran 95 compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-10-multilib \
    gfortran-11 \
    gfortran-11-multilib \
    gfortran-12 \
    gfortran-12-multilib \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-multilib \
    gfortran-14 \
    gfortran-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for GNU Fortran 95 compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-11 \
    gfortran-12 \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for GNU Fortran 95 compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-11 \
    gfortran-12 \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for GNU Fortran 95 compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-riscv64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-11 \
    gfortran-12 \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM POWER8 architecture maintenance for GNU Fortran 95 compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-11 \
    gfortran-12 \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for GNU Fortran 95 compiler (multilib)
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gfortran-all AS gfortran-s390x

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gfortran-10 \
    gfortran-10-multilib \
    gfortran-11 \
    gfortran-11-multilib \
    gfortran-12 \
    gfortran-12-multilib \
    gfortran \
    gfortran-mingw-w64 \
    gfortran-multilib \
    gfortran-14 \
    gfortran-14-multilib \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU Fortran 95 compiler
#
# ############################################################################

FROM gfortran-${TARGETARCH} AS gfortran

# ############################################################################
#
# All architectures maintenance for GNU Modula-2 compiler
#
# ############################################################################

FROM gfortran AS gm2-all

# ############################################################################

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gm2-10 \
    gm2-11 \
    gm2-12 \
    gm2 \
    gm2-14 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU Modula-2 compiler
#
# ############################################################################

FROM gm2-all AS gm2

# ############################################################################
#
# All architectures maintenance for GNU Ada compiler
# - with Win32 and Win64 using MinGW-w64 for
#   - Win32/POSIX
#   - Win32/Win32
#   - Win64/POSIX
#
# ############################################################################

FROM gm2 AS gnat-all

# ############################################################################

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gnat \
    gnat-mingw-w64 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU Ada compiler
#
# ############################################################################

FROM gnat-all AS gnat

# ############################################################################
#
# All architectures maintenance for COBOL Programming Tools
# - GNU COBOL compiler
#
# ############################################################################

FROM gnat AS cobol-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gnucobol \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for COBOL Programming Tools
#
# ############################################################################

FROM cobol-all AS cobol

# ############################################################################
#
# All architectures maintenance for Forth Programming Tools
# - GNU Forth Language Environment
#
# ############################################################################

FROM cobol AS forth-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gforth \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for Forth Programming Tools
#
# ############################################################################

FROM forth-all AS forth

# ############################################################################
#
# All architectures maintenance for Pascal Programming Tools
# - Free Pascal compiler
#
# ############################################################################

FROM forth AS pascal-all

# ############################################################################
#
# AMD/x86 64-bit architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-amd64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    fp-compiler \
    fp-units-base \
    fp-units-db \
    fp-units-fcl \
    fp-units-fv \
    fp-units-gfx \
    fp-units-gtk2 \
    fp-units-math \
    fp-units-misc \
    fp-units-multimedia \
    fp-units-net \
    fp-units-wasm \
    fp-units-win-base \
    fp-units-win-db \
    fp-units-win-fcl \
    fp-units-win-fv \
    fp-units-win-gfx \
    fp-units-win-gtk2 \
    fp-units-win-math \
    fp-units-win-misc \
    fp-units-win-multimedia \
    fp-units-win-net \
    fp-units-win-wasm \
    fp-utils \
    pasdoc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv7 32-bit architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-arm

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    fp-compiler \
    fp-units-base \
    fp-units-db \
    fp-units-fcl \
    fp-units-fv \
    fp-units-gfx \
    fp-units-gtk2 \
    fp-units-math \
    fp-units-misc \
    fp-units-multimedia \
    fp-units-net \
    fp-units-wasm \
    fp-utils \
    pasdoc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# ARMv8 64-bit architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-arm64

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    fp-compiler \
    fp-units-base \
    fp-units-db \
    fp-units-fcl \
    fp-units-fv \
    fp-units-gfx \
    fp-units-gtk2 \
    fp-units-math \
    fp-units-misc \
    fp-units-multimedia \
    fp-units-net \
    fp-units-wasm \
    fp-utils \
    pasdoc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# RISC-V 64-bit architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-riscv64

# ############################################################################
#
# IBM POWER8 architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-ppc64le

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    fp-compiler \
    fp-units-base \
    fp-units-db \
    fp-units-fcl \
    fp-units-fv \
    fp-units-gfx \
    fp-units-gtk2 \
    fp-units-math \
    fp-units-misc \
    fp-units-multimedia \
    fp-units-net \
    fp-units-wasm \
    fp-utils \
    pasdoc \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# IBM z-Systems architecture maintenance for Pascal Programming Tools
#
# ############################################################################

FROM pascal-all AS pascal-s390x

# ############################################################################
#
# Final maintenance for Forth Programming Tools
#
# ############################################################################

FROM pascal-${TARGETARCH} AS pascal

# ############################################################################
#
# All architectures maintenance for Scheme/Lisp Programming Tools
# - Gambit Scheme interpreter and compiler
# - GNU Guile 2.2 interpreter
# - GNU Guile 3.0 JIT compiler
#
# ############################################################################

FROM pascal AS lisp-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    gambc \
    guile-2.2 \
    guile-3.0 \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for Scheme/Lisp Programming Tools
#
# ############################################################################

FROM lisp-all AS lisp

# ############################################################################
#
# All architectures maintenance for Meta Programming Tools
# - GNU Bison YACC parser generator
# - Berkeley LALR YACC parser generator
# - Not Yet Another Compiler Compiler
# - Look-Ahead TDFA lexer generator
# - M4 macro processing language
#
# ############################################################################

FROM lisp AS meta-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    bison \
    btyacc \
    byacc \
    flex \
    m4 \
    nyacc \
    re2c \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for Meta Programming Tools
#
# ############################################################################

FROM meta-all AS meta

# ############################################################################
#
# All architectures maintenance for GNU development tools
#
# ############################################################################

FROM meta AS gnu-all

# Install requirements
RUN apt-get --assume-yes update \
 && apt-get --assume-yes install --no-install-recommends \
    autoconf-dickey \
    autoconf2.13 \
    autoconf2.69 \
    autoconf2.64 \
    autoconf \
    autoconf-archive \
    autogen \
    automake1.11 \
    automake \
    autopoint \
    gettext \
    gperf \
    libtool \
    libltdl-dev \
    make-guile \
    pkg-config \
 && apt-get --assume-yes autoremove --purge \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ############################################################################
#
# Final maintenance for GNU development tools
#
# ############################################################################

FROM gnu-all AS gnu

# switch to workspace user
USER $WSUSER_NAME
WORKDIR $WSUSER_HOME
