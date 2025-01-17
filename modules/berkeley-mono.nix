{
  requireFile,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation (attrs: {
  pname = "berkeley-mono";
  version = "2.002";

  src = requireFile {
    name = "berkeley-mono-variable.ttf";
    sha256 = "0gqnzm444i0ii2928mz09in9y51206wvwzgrj63qj5kfz7kv9gvy";
    url = "https://usgraphics.com";
  };

  dontUnpack = true;
  installPhase = ''
    runHook preInstall
    install -D -m444 -t $out/share/fonts/truetype $src
    runHook postInstall
  '';
})
