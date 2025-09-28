#!/bin/sh

ENV_OS="$(uname -s)"
case "$ENV_OS" in
  Linux)   ENV_OS=linux ;;
  Darwin)  ENV_OS=darwin ;;
  FreeBSD) ENV_OS=freebsd ;;
  OpenBSD) ENV_OS=openbsd ;;
  NetBSD)  ENV_OS=netbsd ;;
  SunOS)   ENV_OS=solaris ;;
  *) echo "Unsupported OS: $ENV_OS" >&2; exit 1 ;;
esac

ENV_ARCH="$(uname -m)"
case "$ENV_ARCH" in
  x86_64|amd64)        ENV_ARCH=amd64 ;;
  aarch64|arm64)       ENV_ARCH=arm64 ;;
  armv7l|armv7|armv6l|armv6|armhf) ENV_ARCH=arm ;;   # 32-bit ARM
  i386|i686)           ENV_ARCH=386 ;;
  ppc64le)             ENV_ARCH=ppc64le ;;
  s390x)               ENV_ARCH=s390x ;;
  riscv64)             ENV_ARCH=riscv64 ;;
  *) echo "Unsupported arch: $ENV_ARCH" >&2; exit 1 ;;
esac

echo "ENV_OS = $ENV_OS"
echo "ENV_ARCH = $ENV_ARCH"
