# BATTLEMESH

**Cliente de terminal para nodos [Meshtastic](https://meshtastic.org) por USB.**
Visual, con soporte de mouse, doble check de entrega y 100% local — no necesita
internet para funcionar.

*dev: Ramiro Spinolo*

```
                                             ##
                                          ###########
                                          ###########
                                #################################################
     #############################################################################
     #####################################################################################################
     ###################      ########################  ##########################
     ###      #####               #######  # #########
     #########                   ##### #     #########
      #####                     #####         ########
                              ######          ########
                                ####          ######
 ____    _  _____ _____ _     _____ __  __ _____ ____  _   _
| __ )  / \|_   _|_   _| |   | ____|  \/  | ____/ ___|| | | |
|  _ \ / _ \ | |   | | | |   |  _| | |\/| |  _| \___ \| |_| |
| |_) / ___ \| |   | | | |___| |___| |  | | |___ ___) |  _  |
|____/_/   \_\_|   |_| |_____|_____|_|  |_|_____|____/|_| |_|
```

## Características

- 📢 **Grupos y canales** y 💬 **mensajes directos (DM)**, en una lista lateral
  clickeable con el mouse.
- ✓✓ **Doble check de entrega** (estilo WhatsApp): sabés si el mensaje salió y
  si el otro nodo lo recibió.
- 📮 **Reenvío automático**: los DM que no llegan quedan en cola y se reintentan
  solos cuando el nodo destino vuelve a estar en línea (sobrevive a reinicios).
- 🔎 **Buscador de nodos** por nombre, pensado para redes con muchos nodos.
- 🔔 **Sonido de notificación** al recibir, activable/desactivable.
- 📝 **Historial persistente** por conversación, con borrado individual.
- 🖥 **Control remoto de la pantalla del nodo**: cambiá de pantalla en el OLED
  desde la PC, sin usar el botón físico.
- 🔌 **Autodetección**: encuentra la placa LoRa en cualquier puerto USB.

## Instalación

### Opción A — paquete `.deb` (Debian / Ubuntu / Linux Mint)

```bash
sudo apt install ./battlemesh_1.0.0_all.deb
```

Deja el comando `battlemesh` en el sistema y una entrada en el menú.

### Opción B — script portátil (cualquier Linux)

```bash
chmod +x mesh
./mesh
```

Es **un solo archivo autosuficiente**: en la primera ejecución crea su propio
entorno virtual e instala las dependencias (necesita internet **solo esa vez**).

### Requisitos

- **Python 3.9+** y **python3-venv** (`sudo apt install python3-venv`)
- Pertenecer al grupo **dialout** para acceder al puerto serie:
  ```bash
  sudo usermod -aG dialout $USER   # cerrá sesión y volvé a entrar
  ```
- Opcional, para el sonido: `pulseaudio-utils` (`paplay`).

## Uso

```bash
battlemesh                # autodetecta la placa LoRa conectada
battlemesh /dev/ttyUSB1   # forzar un puerto concreto
```

> ⚠️ **Un solo programa puede usar el puerto USB a la vez.** Cerrá el web client
> de Meshtastic u otra instancia antes de abrir BATTLEMESH.

### Atajos de teclado

| Tecla | Acción |
|---|---|
| `Enter` | Enviar el mensaje a la conversación seleccionada |
| `F2` | Sonido de notificación on/off (se recuerda) |
| `F3` | Borrar historial de la conversación (confirmar con F3 otra vez) |
| `F5` | Refrescar la lista de nodos |
| `F6` / `F7` | Cambiar la pantalla del nodo: ◀ anterior / ▶ siguiente |
| `F8` | OK / entrar en la pantalla del nodo |
| `q` / `Ctrl+C` | Salir |

### Marcas de entrega

| Marca | Significado |
|---|---|
| ✓ | El mensaje **salió** de tu nodo |
| ✓✓ | El **nodo destino lo recibió** (ACK de la malla) |
| 🕓 | **En cola**: el destino no responde; se reenvía cuando vuelva a estar en línea |
| ✗ | Error al enviar |

En canales/broadcast, ✓✓ significa que el mensaje entró en la malla (un vecino
lo retransmitió), no que cada integrante lo haya leído.

## Dónde guarda los datos

| Archivo | Contenido |
|---|---|
| `~/.local/share/mesh-tui/history.json` | Historial de conversaciones |
| `~/.local/share/mesh-tui/config.json` | Preferencias (sonido) |
| `~/.local/share/mesh-tui/venv/` | Entorno con las dependencias |

Para borrar todo el historial de una: eliminá `history.json`.

## Notas y limitaciones

- El **reenvío de mensajes pendientes** ocurre a nivel de la aplicación:
  funciona mientras BATTLEMESH esté abierto. Un *store-and-forward*
  independiente de la PC requiere un nodo router con ese módulo del firmware.
- El **control de pantalla remoto** usa el comando `send_input_event` del
  firmware; su efecto depende de la versión y del modelo de nodo.
- Probado sobre Heltec WiFi LoRa 32 V2 con firmware Meshtastic 2.7.x en
  Linux Mint 22.

## Compilar el `.deb`

```bash
./build-deb.sh
```

Genera `battlemesh_<version>_all.deb` en el directorio actual.

## Licencia

MIT — ver [LICENSE](LICENSE).
