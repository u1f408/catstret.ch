let
  nixpkgs = builtins.fetchTarball {
    name = "source";
    url = "https://github.com/NixOS/nixpkgs/archive/3e362ce63e16b9572d8c2297c04f7c19ab6725a5.tar.gz";
    sha256 = "sha256:03csxn73wxlqffp3sscjg2mf4a4xl62yawhaxm6dhgwchjnq1nnx";
  };

  pkgs = import nixpkgs {};
  fhsenv = pkgs.buildFHSUserEnv {
    name = "lbmk-deps";
    targetPkgs = _: (with pkgs; [
      bashInteractive
      gnat
      ccache
      pkg-config-unwrapped
      cmake
      autoconf
      automake
      libtool
      bc
      m4
      flex
      bison
      zlib
      gettext
      ncurses
      freetype
      p7zip
      unzip
      innoextract
      openssl
      gnutls
      libuuid
      swig

      (python3.withPackages (py: with py; [
        setuptools
      ]))
    ]);

    extraOutputsToInstall = [ "dev" ];
    extraBuildCommands = ''
      # grub2 source expects unifont to be in /usr/share/fonts/unifont, but adding unifont
      # to targetPkgs above will put it in /usr/share/fonts directly, so symlink it in place
      mkdir -p $out/usr/share/fonts
      ln -s ${pkgs.unifont}/share/fonts $out/usr/share/fonts/unifont
    '';

    runScript = "bash";
    profile = ''
      export XBMK_THREADS=`nproc`
      export LIBRARY_PATH=/usr/lib
      export C_INCLUDE_PATH=/usr/include
      export CPLUS_INCLUDE_PATH=/usr/include
    '';
  };

in fhsenv.env
