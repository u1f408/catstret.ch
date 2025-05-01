---
title: nix incantations to build libreboot
layout: post
tags:
  - tidbits
  - libreboot
  - nix
---

i daily-drive [NixOS](<https://nixos.org>). i also use [Libreboot](<https://libreboot.org>) on the computers of mine that support it.
while setting up a ThinkPad T420, i ran into a SeaBIOS bug, [which i've reported to the libreboot developers][lbmk-sbrevert], but in order to help test fixes for that, i needed a working build environment on the T420. which is running NixOS.

this is a problem.

some parts of the Libreboot build scripts; and some of the build processes for the individual components (looking at you, GRUB2...) assume they're running on a system that conforms to the [Filesystem Hierarchy Standard][fhs], which NixOS does not.
thankfully, nixpkgs has the [buildFHSEnv family of helpers][nix-fhsenv] - so here's a `shell.nix` that sets up a FHS environment suitable for building Libreboot.

<!--cut-->

{% highlight nix %}
{% include_snippet libreboot-build-shell.nix %}
{% endhighlight %}

([here's a link to a file of the above, so you don't have to copy/paste]({{ site.baseurl }}/snippets/libreboot-build-shell.nix))

[lbmk-sbrevert]: https://codeberg.org/libreboot/lbmk/commit/8245f0b3211812ac818adadd6526b0b39c63f3f0
[fhs]: https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html
[nix-fhsenv]: https://ryantm.github.io/nixpkgs/builders/special/fhs-environments/
