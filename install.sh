#!/usr/bin/env bash
# Instala 'mesh' como comando global en ~/.local/bin
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.local/bin"
mkdir -p "$DEST"
cp "$HERE/mesh" "$DEST/mesh"
chmod +x "$DEST/mesh"
echo "✅ Copiado a $DEST/mesh"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) echo "✅ ~/.local/bin ya está en tu PATH. Escribí:  mesh" ;;
  *)
    echo "⚠  ~/.local/bin no está en tu PATH. Agregalo con:"
    echo "     echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc && source ~/.bashrc"
    ;;
esac
echo "La primera vez que corras 'mesh' se auto-instalan las dependencias (1-2 min)."
