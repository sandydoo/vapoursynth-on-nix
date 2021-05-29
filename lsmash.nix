{ lib, stdenv, fetchFromGitHub, which }:

stdenv.mkDerivation rec {
  pname = "lsmash";
  version = "v2.14.5";

  src = fetchFromGitHub {
    owner  = "l-smash";
    repo   = "l-smash";
    rev    = version;
    sha256 = "0rcq9727im6kd8da8b7kzzbzxdldvmh5nsljj9pvr4m3lj484b02";
  };

  nativeBuildInputs = [ which ];

  meta = with lib; {
    description = "A cross-platform library that handles ISO Base Media file formats and their derivative file formats, including MP4.";
    homepage    = "https://l-smash.github.io/l-smash/";
    license     = licenses.isc;
    platforms   = platforms.x86_64;
  };
}
