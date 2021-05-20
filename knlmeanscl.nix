let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) lib stdenv fetchFromGitHub intel-ocl ocl-icd opencl-headers meson ninja pkg-config boost vapoursynth;

  # boost = pkgs.boost.override { enableShared = false; enabledStatic = true; };
in stdenv.mkDerivation rec {
  pname = "knlmeanscl";
  version = "master";

  src = fetchFromGitHub {
    owner  = "Khanattila";
    repo   = "KNLMeansCL";
    rev    = version;
    sha256 = "1qx82nk4fxalwxy9i617f97arhs7i7labvm9dnnp5gn1qdm0pps3";
  };

  # Meson is no longer able to pick up Boost automatically.
  # https://github.com/NixOS/nixpkgs/issues/86131
  BOOST_INCLUDEDIR = "${lib.getDev boost}/include";
  BOOST_LIBRARYDIR = "${lib.getLib boost}/lib";

  nativeBuildInputs = [ intel-ocl ocl-icd meson ninja pkg-config ];

  buildInputs = [
    boost
    boost.dev
    opencl-headers
    vapoursynth
  ];

  patches = [
    ./patches/fix-export-knlmeanscl.patch
  ];

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libknlmeanscl.so $out/lib/vapoursynth/libknlmeanscl.so
  '';

  meta = with lib; {
    description = "An optimized OpenCL implementation of the Non-local means de-noising algorithm";
    homepage    = "https://github.com/Khanattila/KNLMeansCL";
    license     = licenses.gpl3;
    platforms   = platforms.x86_64;
  };
}
