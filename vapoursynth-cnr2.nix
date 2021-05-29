{ lib, stdenv, fetchFromGitHub, autoreconfHook, pkg-config, vapoursynth }:

stdenv.mkDerivation rec {
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

  configureFlags = [ "--libdir=$(out)/lib/vapoursynth" ];

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
