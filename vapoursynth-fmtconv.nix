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
    sha256 = "1vaiwws3jqglv59fvlxrbkwynrrwj9597mi4z37jvsdzicpmrf0i";
  };

  nativeBuildInputs = [ autoreconfHook ];

  sourceRoot = "source/build/unix";

  # Not sure what the “right” way of dealing with these repos is.
  preBuild = ''
    chmod -R 755 ../../src
  '';

  postInstall = ''
    mkdir $out/lib/vapoursynth
    ln -s $out/lib/libfmtconv.so $out/lib/vapoursynth/libfmtconv.so
  '';

  meta = with lib; {
    description = "Format conversion tools for Vapoursynth";
    homepage    = "https://github.com/EleonoreMizo/fmtconv";
    license     = licenses.gpl2;
    platforms   = platforms.x86_64;
  };
}
