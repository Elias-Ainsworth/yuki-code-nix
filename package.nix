{
  lib,
  stdenvNoCC,
  fetchzip,
}:

stdenvNoCC.mkDerivation {
  pname = "Yuki Code";
  version = "0.2.0";

  src = fetchzip {
    url = "https://github.com/makenowjust/yuki-code/archive/refs/tags/v0.2.0.zip";
    hash = "sha256-gGlLjLvm8Df+YOdXsykZSl+BWrFBX5nrCPieGXam3a4=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/opentype
    mv *.otf $out/share/fonts/opentype

    runHook postInstall
  '';

  meta = {
    description = "Yuki Code";
    longDescription = '''';
    homepage = "https://github.com/makenowjust/yuki-code";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
