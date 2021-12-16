{ pkgs ? import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; } }:
with pkgs;
let
  vapoursynth = pkgs.vapoursynth.withPlugins [
    knlmeanscl
    vapoursynth-bm3d
    vapoursynth-fft3dfilter
    vapoursynth-fmtconv
    vapoursynth-lsmash
    vapoursynth-mvtools
    vapoursynth-nnedi3
  ];
in mkShell {
  nativeBuildInputs = [
    python38
    ffmpeg
    lsmash
    vapoursynth
  ];
}
