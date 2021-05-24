let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) lib stdenv fetchFromGitHub autoreconfHook pkg-config yasm vapoursynth;

in stdenv.mkDerivation rec {
  pname = "vapoursynth-nnedi3";
  version = "v12";

  src = fetchFromGitHub {
    owner  = "dubhater";
    repo   = "vapoursynth-nnedi3";
    rev    = version;
    sha256 = "1valcf8ns4wrfq6q5js029a93i58vr37mqw5na6922avg04wzpwd";
  };

  nativeBuildInputs = [ autoreconfHook pkg-config yasm ];

  buildInputs = [ vapoursynth ];

  configureFlags = [ "--libdir=$(out)/lib/vapoursynth" ];

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
