let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) lib stdenv fetchFromGitHub autoreconfHook pkg-config yasm vapoursynth;

in stdenv.mkDerivation rec {
  pname = "vapoursynth-cnr2";
  version = "v1";

  src = fetchFromGitHub {
    owner  = "dubhater";
    repo   = "vapoursynth-cnr2";
    rev    = version;
    sha256 = "1valcf8ns4wrfq6q5js029a53i58vr37mqw5na6922avg04wzpwd";
  };

  nativeBuildInputs = [ autoreconfHook ];

  buildInputs = [ vapoursynth ];

  postInstall = ''
    mkdir $out/lib/vapoursynth
    ln -s $out/lib/libnnedi3.so $out/lib/vapoursynth/libnnedi3.so
  '';

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
