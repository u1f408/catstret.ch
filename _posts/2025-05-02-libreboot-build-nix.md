---
title: nix incantations to build libreboot
subtitle: ... along with a tale of a broken SeaBIOS commit
layout: post
tags:
  - libreboot
  - hardware
  - nix
---

i tend to like using [Libreboot](<https://libreboot.org>) on the computers of mine that support it -
which is many of them, because i have far too many ThinkPads.

while setting up Libreboot on a ThinkPad T420, i ran into a SeaBIOS bug -
the AHCI initialization code had been recently updated, and it seemed to have broken things...

<!--cut-->

```
<irys> ooh this is fun. seabios commit 8863cbbd15a73b03153553c562f5b1fb939ad4d7 (ahci: add controller reset) breaks ahci entirely on t420
<irys> cbmem console on that seabios commit has a timeout then "AHCI/0: device not ready"
<irys> AHCI works fine if i change config/seabios/default/target.cfg to use the immediate previous seabios commit (df9dd418b3b0e586cb208125094620fc7f90f23d)
<irys> works in grub payload either way though
<irys> here, `cbmem -c` after booting the broken rev: https://0x0.st/84oQ.log
<irys> compared to the working one https://0x0.st/84o1.log
```

[the SeaBIOS version in Libreboot was rolled back][lbmk-sbrevert] while we debugged the issue,
a patch was written to hopefully restore functionality, which i tested and confirmed it did,
and then [that patch, with a revert of the SeaBIOS version rollback, went into Libreboot][lbmk-sbpatch].

skipping back, though - actually getting to the point of figuring out the above was...
slightly problematic...

i use [NixOS](<https://nixos.org>) on most of my machines, because declarative system configs are fun.
however, some parts of the Libreboot build scripts; and some of the build processes for the individual
components built in Libreboot (looking at you, GRUB2...) assume they're running on a system that conforms
to the [Filesystem Hierarchy Standard][fhs], which NixOS does not.

thankfully, nixpkgs has the [buildFHSEnv family of helpers][nix-fhsenv] -
so here's a `shell.nix` that sets up a FHS environment suitable for building Libreboot.

{% highlight nix %}
{% include_snippet libreboot-build-shell.nix %}
{% endhighlight %}

([here's a link to a file of the above, so you don't have to copy/paste]({{ site.baseurl }}/snippets/libreboot-build-shell.nix))

we got there in the end though!

[lbmk-sbrevert]: https://codeberg.org/libreboot/lbmk/commit/8245f0b3211812ac818adadd6526b0b39c63f3f0
[lbmk-sbpatch]: https://codeberg.org/libreboot/lbmk/commit/c073ee9d4fc4a631c16ff681bb62c29b952878ba
[fhs]: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html
[nix-fhsenv]: https://ryantm.github.io/nixpkgs/builders/special/fhs-environments/
