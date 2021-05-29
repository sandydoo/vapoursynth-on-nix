{ lib, stdenv, fetchFromGitHub, meson, ninja, pkg-config
, fftwFloat, vapoursynth
}:

stdenv.mkDerivation rec {
  pname = "vapoursynth-bm3d";
  version = "r8";

  src = fetchFromGitHub {
    owner  = "HomeOfVapourSynthEvolution";
    repo   = "VapourSynth-BM3D";
    rev    = version;
    sha256 = "0hifiyqr0vp3rkqrjbz2fvka7s8xvcpl58rjf0rvljs64bxia4v7";
  };

  nativeBuildInputs = [ meson ninja pkg-config fftwFloat ];

  buildInputs = [ vapoursynth ];

  patches = [
    ./patches/fix-export-bm3d.patch
  ];

  postInstall = ''
    mkdir -p $out/lib/vapoursynth
    ln -s $out/lib/libbm3d.so $out/lib/vapoursynth/libbm3d.so
  '';

  meta = with lib; {
    description = "BM3D denoising filter for VapourSynth";
    homepage    = "https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D";
    license     = licenses.mit;
    platforms   = platforms.x86_64;
  };
}
