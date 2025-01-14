{ lib, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, curl
, boost
, liboauth
, jsoncpp
, htmlcxx
, rhash
, tinyxml-2
, help2man
}:

stdenv.mkDerivation rec {
  pname = "lgogdownloader";
  version = "3.8";

  src = fetchFromGitHub {
    owner = "Sude-";
    repo = "lgogdownloader";
    rev = "v${version}";
    sha256 = "sha256-LywFJCZevlhthOkAZo7JkXcPT9V6Zh28VD/MVQnMQjo=";
  };

  nativeBuildInputs = [ cmake pkg-config help2man ];

  buildInputs = [ boost curl htmlcxx jsoncpp liboauth rhash tinyxml-2 ];

  meta = with lib; {
    description = "Unofficial downloader to GOG.com for Linux users. It uses the same API as the official GOGDownloader";
    homepage = "https://github.com/Sude-/lgogdownloader";
    license = licenses.wtfpl;
    platforms = platforms.linux;
  };
}
