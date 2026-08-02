#!/usr/bin/env bash
# Construye el paquete battlemesh_<VERSION>_all.deb
set -e

VERSION="${1:-1.0.0}"
HERE="$(cd "$(dirname "$0")" && pwd)"
BUILD="$HERE/build/battlemesh_${VERSION}_all"

command -v dpkg-deb >/dev/null || { echo "Falta dpkg-deb (sudo apt install dpkg)"; exit 1; }

rm -rf "$BUILD"
mkdir -p "$BUILD/DEBIAN" "$BUILD/usr/bin" \
         "$BUILD/usr/share/applications" "$BUILD/usr/share/doc/battlemesh"

install -m 755 "$HERE/mesh" "$BUILD/usr/bin/battlemesh"

cat > "$BUILD/DEBIAN/control" <<EOF
Package: battlemesh
Version: ${VERSION}
Section: comm
Priority: optional
Architecture: all
Depends: python3 (>= 3.9), python3-venv
Recommends: pulseaudio-utils
Maintainer: Ramiro Spinolo <ramiro@battlemesh.local>
Description: BATTLEMESH - cliente TUI de Meshtastic por USB
 Cliente de terminal con soporte de mouse para nodos Meshtastic
 conectados por USB: chat de grupos y mensajes directos, doble check
 de entrega (enviado/recibido), reenvio al volver online, sonido de
 notificacion, historial persistente, buscador de nodos y control
 remoto de la pantalla del nodo. Autodetecta la placa LoRa en cualquier
 puerto USB. En la primera ejecucion instala sus dependencias en un
 entorno propio del usuario (requiere internet esa vez).
EOF

cat > "$BUILD/DEBIAN/postinst" <<'EOF'
#!/bin/sh
set -e
echo ""
echo "BATTLEMESH instalado. Ejecutalo con:  battlemesh"
echo "  - Si el puerto USB no abre, agregate al grupo dialout:"
echo "      sudo usermod -aG dialout \$USER   (y reinicia sesion)"
echo "  - La primera ejecucion descarga dependencias (internet una vez)."
echo ""
exit 0
EOF
chmod 755 "$BUILD/DEBIAN/postinst"

cat > "$BUILD/usr/share/applications/battlemesh.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=BATTLEMESH
Comment=Cliente Meshtastic por USB (terminal)
Exec=battlemesh
Terminal=true
Categories=Network;HamRadio;Utility;
Icon=utilities-terminal
EOF

install -m 644 "$HERE/README.md" "$BUILD/usr/share/doc/battlemesh/README.md"
install -m 644 "$HERE/LICENSE"   "$BUILD/usr/share/doc/battlemesh/copyright"

dpkg-deb --root-owner-group --build "$BUILD" "$HERE/battlemesh_${VERSION}_all.deb"
echo "✅ Listo: $HERE/battlemesh_${VERSION}_all.deb"
