let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) lib stdenv fetchFromGitHub meson pkg-config ninja fftwFloat vapoursynth;

in stdenv.mkDerivation rec {
  pname = "vapoursynth-fft3dfilter";
  version = "8562ea719c82332dc69e032d1174edc3ada0a372";

  src = fetchFromGitHub {
    owner  = "myrsloik";
    repo   = "VapourSynth-FFT3DFilter";
    rev    = version;
    sha256 = "0d1p9hxn0b0ljfmxs9xg3lrcj6a3yijcpmq72n0y33srkxma7wwv";
  };

  nativeBuildInputs = [ meson ninja pkg-config ];

  buildInputs = [ vapoursynth fftwFloat ];

  patches = [
    ./patches/fix-export-fft3d.patch
  ];

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libfft3dfilter.so $out/lib/vapoursynth/libfft3dfilter.so
  '';

  meta = with lib; {
    description = "VapourSynth port of FFT3DFilter";
    homepage    = "https://github.com/myrsloik/VapourSynth-FFT3DFilter";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
