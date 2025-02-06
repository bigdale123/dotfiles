# Copyright 2025 Sizhe Zhao
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { config, pkgs, ... }:
        {
          packages = {
            default = config.packages.sdr-trunk;
            sdr-trunk =
              let
                jdk = pkgs.jdk23.override { enableJavaFX = true; };
                gradle = pkgs.gradle.override { java = jdk; };
                self = pkgs.stdenv.mkDerivation rec {
                  pname = "sdr-trunk";
                  version = "0.6.1";

                  src = pkgs.fetchFromGitHub {
                    owner = "DSheirer";
                    repo = "sdrtrunk";
                    rev = "v${version}";
                    hash = "sha256-5cklAqO7KyDdkQM0fCZTT8DHsZx/Tf0c8B9TiLMLrkA=";
                  };

                  nativeBuildInputs = [
                    gradle
                  ];

                  mitmCache = gradle.fetchDeps {
                    pkg = self;
                    data = ./deps.json;
                  };

                  gradleBuildTask = "runtimeZipCurrent";

                  installPhase = ''
                    cp -r build/image/sdr-trunk-linux-x86_64-v${version} $out
                  '';

                  meta.mainProgram = "sdr-trunk";
                };
              in
              self;
          };
        };
    };
}
