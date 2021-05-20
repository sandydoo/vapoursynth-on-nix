self: super: rec {
  lsmash = import ../lsmash.nix;
  vapoursynth-lsmash = import ../vapoursynth-lsmash.nix;
  vapoursynth-fft3dfilter = import ../vapoursynth-fft3dfilter.nix;
  vapoursynth-fmtconv = import ../vapoursynth-fmtconv.nix;
  vapoursynth-nnedi3 = import ../vapoursynth-nnedi3.nix;
  vapoursynth-bm3d = import ../vapoursynth-bm3d.nix;
  knlmeanscl = import ../knlmeanscl.nix;
}
