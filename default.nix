let
  sources = import ./nix/sources.nix;
  pkgs = import <nixpkgs> {};
  dapptools = import sources.dapptools {};
in with pkgs;
pkgs.stdenv.mkDerivation rec {
  name = "radgov-${version}";
  version = "0.0.1";
  src = ./.;

  nativeBuildInputs = [makeWrapper];
  dontBuild = true;
  makeFlags = ["prefix=$(out)"];

  postInstall =
    let
      path = lib.makeBinPath [ coreutils perl dapptools.seth ];
    in
      ''
        wrapProgram "$out/bin/radgov" \
          --prefix PATH : ${path} \
        ${lib.optionalString (glibcLocales != null) ''
          --set LOCALE_ARCHIVE ${glibcLocales}/lib/locale/locale-archive
      ''}
  '';

  meta = {
    description = "Command-line tool for interacting with radicle governance";
    homepage = https://github.com/mrchico/radgov;
    license = lib.licenses.gpl3;
    inherit version;
  };
}
