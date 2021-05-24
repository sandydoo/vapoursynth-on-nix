let
  pkgs = import <nixpkgs> {};

  inherit (pkgs) lib stdenv fetchFromGitHub autoreconfHook;

in stdenv.mkDerivation rec {
  pname = "vapoursynth-fmtconv";
  version = "r22";

  src = fetchFromGitHub {
    owner  = "EleonoreMizo";
    repo   = "fmtconv";
    rev    = version;
    sha256 = "1nvanskvh8qv45h7islwgnyrvdkcn7h9jks5fskg4c00aj6bxrrn";
  };

  nativeBuildInputs = [ autoreconfHook ];

  sourceRoot = "source/build/unix";

  configureFlags = [ "--libdir=$(out)/lib/vapoursynth" ];

  # Not sure what the “right” way of dealing with these repos is.
  preBuild = ''
    chmod -R 755 ../../src
  '';

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
