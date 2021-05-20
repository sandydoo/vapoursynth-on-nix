let
  pkgs = import <nixpkgs> { };

  lsmash = import ./lsmash.nix;

  inherit (pkgs) lib stdenv fetchFromGitHub substituteAll pkg-config which ffmpeg vapoursynth bash;

in stdenv.mkDerivation rec {
  pname = "vapoursynth-lsmash";
  version = "master";

  src = fetchFromGitHub {
    owner  = "VFR-maniac";
    repo   = "L-SMASH-Works";
    rev    = version;
    sha256 = "1pb8rrh184pxy5calwfnmm02i0by8vc91c07w4ygj50y8yfqa3br";
  };

  sourceRoot = "source/VapourSynth";

  nativeBuildInputs = [ pkg-config which ];

  buildInputs = [ vapoursynth ffmpeg  lsmash ];

  patches = [
    (substituteAll {
      src = ./patches/fix-bash.patch;
      bash = "${bash}/bin/bash";
    })
  ];

  preBuild = ''
    chmod -R 755 ../common
  '';

  meta = with lib; {
    description = "Vapoursynth plugin for lsmash";
    homepage    = "https://github.com/VFR-maniac/L-SMASH-Works/tree/master/VapourSynth";
    license     = licenses.isc;
    platforms   = platforms.x86_64;
  };
}
