{ lib, stdenv, fetchFromGitHub, autoreconfHook, vapoursynth }:

stdenv.mkDerivation rec {
  pname = "vapoursynth-fmtconv";
  version = "r22";

  src = fetchFromGitHub {
    owner  = "EleonoreMizo";
    repo   = "fmtconv";
    rev    = version;
    sha256 = "1nvanskvh8qv45h7islwgnyrvdkcn7h9jks5fskg4c00aj6bxrrn";
  };

  nativeBuildInputs = [ autoreconfHook ];

  buildInputs = [ vapoursynth ];

  preAutoreconf = "cd build/unix";

  configureFlags = [ "--libdir=$(out)/lib/vapoursynth" ];

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.wtfpl;
    platforms   = platforms.x86_64;
  };
}
