## Posix

Quick word about posix, a specification is a set of common sharable functionnalities.
A specification for implementing and interfacing with a unix based system is the posix specification.
A posix shell is the primary set of informations relative to the interface that can be shared across systems.
Such a shell is therefore portable.

The Almquist shell(1980) act has the base,
ash,dash(debian's Almquist)


[Last publication: 2018, (2001-2018)](https://pubs.opengroup.org/onlinepubs/9699919799/)

Heavilly defined in POSIX C.
As a reference(shared libs) because unixes are distributed systems.
For functions and datas, they are defined in c headers.

```
<assert.h>
<complex.h>
<ctype.h>
<dirent.h>
<dlfcn.h>
<errno.h>
<fcntl.h>
<fenv.h>
<float.h>
<inttypes.h>
<iso646.h>
<limits.h>
<locale.h>
<math.h>
<pthread.h>
<setjmp.h>
<signal.h>
<stdarg.h>
<stdbool.h>
<stddef.h>
<stdint.h>
<stdio.h>
<stdlib.h>
<string.h>
<sys/stat.h>
<tgmath.h>
<time.h>
<unistd.h>
<utime.h>
<wchar.h>
<wctype.h>
```
Over time, in linux/gnu a lot of preprocessed type derivations
was used to override/refactor/redeclare certains types/intervals,
to accomodate both the kernel and the userspace for different kind of usage.
(glib, muslibc, llvm/clang, cross-compilers, etc...)

more on environnement later.
