distify
=======

`distify` is an extremely simple shell script that copies a Linux binary and
the shared libraries it depends on to a "distribution directory" and then edits
the binary so that it will use these libraries rather than the system ones.
This allows a reasonably portable binary distribution of the application,
without requiring that the end-user install required libraries directly. Such a
distribution is often desirable for applications that depend on obscure or
hard-to-install libraries, or extremely recent or extremely old versions of
libraries.

This distribution method is different from static linking. Note in particular
that static linking can be difficult because (i) static versions of libraries
are not always available, (ii) when they are available, it is often difficult
to modify the build process for arbitrary software to always choose static
versions of libraries, and (iii) some system libraries (e.g., the C library and
name-service resolver libraries) should be dynamically linked even when all
other dependencies are included in order to properly work on a wide range of
systems.

`distify` excludes a whitelisted set of system libraries that are expected to
be either system-specific or very widely available. This list is kept in
`distify-whitelist.txt` as a series of grep patterns.

The author welcomes additional contributions to the whitelist.

Installation
============

Simply run `make` and `make install`:

    $ make
    $ make install

This will install `distify` in `/usr/local`.

Note that `distify` requires `patchelf` (available separately
[here](https://www.github.com/NixOS/patchelf)). `patchelf` is downloaded as a
Git submodule and built automatically when `distify` is compiled and installed.

Usage
=====

To run `distify`, provide the name of your binary and a destination directory
in which to place the modified binary and its libraries:

    $ distify my_binary dist/

This will produce a set of files in `dist/` such that `dist/my_binary` will
execute using local copies of libraries.

Authorship and License
======================

`distify` is written by Chris Fallin `<cfallin@c1f.net>`. It is released under
the MIT License.
