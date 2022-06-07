{ lib, stdenv
, fetchFromGitHub
, sassc
, meson
, ninja
, glib
, gnome
, gtk-engine-murrine
, inkscape
, cinnamon
, makeFontsConf
, python3
}:

stdenv.mkDerivation rec {
  pname = "adw-gtk3";
  version = "2022-06-06";

  src = fetchFromGitHub {
    owner = "lassekongo83";
    repo = pname;
    rev = "547c0e9326ba6c1d5aae9cf88e01d596776f97a8";
    sha256 = "sha256-LoN6uX4apMiUOHDbBA1sgNgFxus8b+2L+t5ZSHJykow=";
  };

  nativeBuildInputs = [
    meson
    ninja
    sassc
    glib
    python3
  ];

  postPatch = ''
    patchShebangs meson/install-file.py
  '';

  meta = with lib; {
    description = "Flat theme with transparent elements for GTK 3, GTK 2 and Gnome Shell";
    homepage = "https://github.com/lassekongo83/adw-gtk3";
    license = licenses.lgpl21Only;
    platforms = platforms.linux;
    maintainers = with maintainers; [ maintainers.AidenPetersen ];
  };
}