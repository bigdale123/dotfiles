{ stdenv, lib, fetchzip, autoPatchelfHook, jdk23, glib, gtk3, xorg, ffmpeg_6-full, sdrplay, openjfx23, glibc, libX11, makeWrapper }:
let
    version = "0.6.1";
in
stdenv.mkDerivation {
    pname = "sdrtrunk";
    version = version;
    #Yeah, the source code exists, I can't hack it. I can't figure out how to package a gradle build in nix.
    src = fetchzip {
        url = "https://github.com/DSheirer/sdrtrunk/releases/download/v${version}/sdr-trunk-linux-x86_64-v${version}.zip";
        hash = "sha256-iMnR8d7fnnpcBAKoPn8zyuTWzcklqy4oyAKsTHljOPc=";
    };

    nativeBuildInputs = [
        (jdk23.override { enableJavaFX = true; })
        makeWrapper
        autoPatchelfHook
        glib
        gtk3
        xorg.libXxf86vm
        ffmpeg_6-full
        sdrplay
        openjfx23
        libX11
        glibc
    ];

    preBuild = ''
        addAutoPatchelfSearchPath ${jdk23}
        addAutoPatchelfSearchPath ${gtk3}
    '';

    autoPatchelfIgnoreMissingDeps = [ "libavcodec.so.5*" "libavformat.so.5*" "libavcodec-ffmpeg.so.5*" "libavformat-ffmpeg.so.5*"];

    installPhase = ''
        runHook preInstall
        mkdir -p $out
        cp -r * $out
        runHook postInstall
    '';

    fixupPhase = ''
        mkdir -p $out/bin
        cat > $out/bin/sdrtrunk <<EOF
        #!/bin/sh
        exec ${pkgs.buildFHSUserEnv}/bin/buildFHSUserEnv --extra-library-path ${lib.makeLibraryPath [ gtk3 gtk4 openjfx23 libX11 glibc ]} --chroot \$@
        EOF
        chmod +x $out/bin/sdrtrunk
    '';

    meta = with lib; {
        description = "A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using Software Defined Radios (SDR).";
        homepage = "https://github.com/DSheirer/sdrtrunk";
        license = licenses.gpl3Only;
        platforms = platforms.unix;
        maintainers = with maintainers; [bigdale123];
        mainProgram = "sdrtrunk";
    };
}