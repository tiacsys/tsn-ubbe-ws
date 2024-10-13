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
# All architectures maintenance for GNU C/C++ compiler
#
# ############################################################################

FROM base AS gcc-all

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

# switch to workspace user
USER $WSUSER_NAME
WORKDIR $WSUSER_HOME
