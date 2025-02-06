{ stdenv, lib, fetchzip, autoPatchelfHook, jdk23, glib, gtk3, xorg, ffmpeg_6-full, sdrplay, glibc, libX11}:
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
        glib
        gtk3
        xorg.libXxf86vm
        xorg.libX11
        ffmpeg_6-full
        sdrplay
        glibc
        libX11
    ];

    autoPatchelfIgnoreMissingDeps = [ "libavcodec.so.5*" "libavformat.so.5*" "libavcodec-ffmpeg.so.5*" "libavformat-ffmpeg.so.5*"];

    installPhase = ''
        runHook preInstall
        mkdir -p $out
        cp -r * $out
        rm $out/bin/sdr-trunk.bat

        # point shell script to correct lib folder
        substituteInPlace $out/bin/sdr-trunk \
            --replace 'APP_HOME="`pwd -P`"' 'APP_HOME="'$out'"'
        runHook postInstall
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