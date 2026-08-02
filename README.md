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
- 📻🌐 **Lista separada en RF y MQTT**, en secciones plegables, con **favoritos ★**
  y orden por actividad.
- 🎨 **21 temas de color**, y todas las preferencias guardadas en tu PC.
- 📶 **Presencia y calidad de enlace**: indicador de en línea / ausente y marcador
  de señal con SNR y RSSI en dB, como en la app del teléfono.
- 🔔 **Sonido de notificación** al recibir, activable/desactivable.
- 📝 **Historial persistente** por conversación, con borrado individual.
- 🖥 **Control remoto de la pantalla del nodo**: cambiá de pantalla en el OLED
  desde la PC, sin usar el botón físico.
- ⚙️ **Configuración completa del nodo** (`F9`): todos los parámetros de Meshtastic
  organizados en pestañas, con modo **Básico/Avanzado**, carga de la configuración
  actual del aparato y validación de los límites del firmware.
- 🔌 **Autodetección**: encuentra la placa LoRa en cualquier puerto USB.

## Instalación

### Opción A — paquete `.deb` (Debian / Ubuntu / Linux Mint)

```bash
sudo apt install ./battlemesh_1.4.3_all.deb
```

Deja el comando `battlemesh` en el sistema y una entrada en el menú.

### Opción B — script portátil (cualquier Linux)

```bash
chmod +x mesh
./mesh
```

Es **un solo archivo autosuficiente**: en la primera ejecución crea su propio
entorno virtual e instala las dependencias (necesita internet **solo esa vez**).

### Actualizar

Desde la versión **1.3.0** se actualiza solo, con un comando:

```bash
battlemesh --update            # o: sudo battlemesh --update si está en /usr/bin
```

Descarga la última versión publicada, **la valida antes de reemplazar nada** y
guarda una copia de la anterior (`.backup-<versión>`) por si querés volver atrás.
Si ya estás al día, no hace nada.

> ⚠️ **Si tenés una versión anterior a la 1.3.0**, ese comando todavía no existe:
> la primera actualización hay que hacerla a mano, y de ahí en más ya funciona
> `--update`.
>
> ```bash
> # instalado con install.sh (en ~/.local/bin)
> curl -fsSL https://raw.githubusercontent.com/Rama2551/battlemesh/main/mesh \
>   -o ~/.local/bin/mesh && chmod +x ~/.local/bin/mesh
>
> # si clonaste el repo
> git pull
>
> # si instalaste el .deb
> curl -fsSLO https://raw.githubusercontent.com/Rama2551/battlemesh/main/battlemesh_1.4.3_all.deb
> sudo apt install ./battlemesh_1.4.3_all.deb
> ```

### Otros comandos

```bash
battlemesh --version    # qué versión tenés instalada
battlemesh --help       # ayuda rápida
```

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
| `F4` | Alternar nombres **largos** (`Aliencool`) / **cortos** (`alie`) |
| `F5` | Refrescar la lista de nodos |
| `F6` / `F7` | Cambiar la pantalla del nodo: ◀ anterior / ▶ siguiente |
| `F8` | OK / entrar en la pantalla del nodo |
| `F9` | **Configuración** (opciones del programa + del nodo) |
| `F10` | Marcar/desmarcar el nodo actual como **favorito ★** |
| `q` / `Ctrl+C` | Salir |

## Configuración (`F9`)

Abre un panel en pestañas con las opciones **del programa** y **toda** la
configuración del nodo:

| Pestaña | Contenido |
|---|---|
| 🖥 **Programa** | **Tema de colores**, separar RF/MQTT, sonido, nombres largos, favoritos |
| 👤 Identidad | Nombre largo y corto del nodo |
| 📡 LoRa | Región, preset de módem, saltos, potencia, frecuencia… |
| 🖥 Pantalla | Tiempo encendida, carrusel, unidades, orientación… |
| 🔵 Bluetooth | Activación, modo de PIN, PIN fijo |
| ⚙ Dispositivo | Rol, rebroadcast, botones, zona horaria… |
| 📍 Posición | GPS, posición fija, intervalos de emisión |
| 🔋 Energía | Ahorro, tiempos de sueño, batería |
| 🌐 Red | WiFi, Ethernet, NTP, syslog |
| 🔒 Seguridad | Claves y permisos de administración |
| 🧩 Módulos | MQTT, telemetría, store&forward, canned messages, sensores… |

- **Al abrirlo carga la configuración que el aparato tiene en ese momento.**
- El switch **«Modo avanzado»** alterna entre los parámetros de uso corriente y
  la totalidad de los campos (~180).
- **Respeta los límites del firmware**: por ejemplo, el nombre corto admite hasta
  4 caracteres y el `hop_limit` debe estar entre 1 y 7. Si algo no cumple, avisa
  y **no escribe nada** en el nodo.
- Guarda **solo lo que cambiaste** (`Ctrl+S` o el botón *Guardar*); las demás
  secciones quedan intactas. Tras guardar, el nodo se reinicia unos segundos.
- Las opciones de la pestaña **🖥 Programa** se aplican al instante y **no tocan
  el nodo**: son preferencias tuyas y se guardan en esta PC.

## Lista de nodos: RF, MQTT y favoritos

Los nodos se agrupan en dos secciones **plegables** (clic en el encabezado), que
pueden estar **abiertas a la vez**:

| Sección | Qué contiene |
|---|---|
| 📻 **Por radio (RF)** | Nodos que tu equipo **escuchó de verdad** por LoRa |
| 🌐 **Por internet (MQTT)** | Nodos que llegan por el puente, y los que figuran en la base sin contacto propio |

La presencia se calcula con **cualquier paquete** recibido de ese nodo, no sólo
con sus anuncios de identidad: si alguien te escribe, pasa a *en línea* al toque.

La separación se puede **desactivar** desde `F9` → 🖥 Programa → *Separar por MQTT
y RF*; con ella apagada, todos los nodos aparecen en una única lista.

**Orden de la lista** (siempre): primero los **favoritos ★**, después los que
están **en línea**, y el resto por **última vez visto**.

Para marcar un favorito: abrí la conversación con ese nodo y apretá **`F10`**.

### Presencia y señal de los nodos

Junto a cada nodo aparece su estado y la calidad del enlace:

| Indicador | Significado |
|---|---|
| `●` verde | En línea (escuchado hace menos de 5 min) |
| `●` amarillo | Visto hace poco (menos de 2 h) |
| `○` gris | **No está en línea** (el nombre se ve atenuado) |
| `▂▄▆█` | Señal excelente · `▂▄▆▁` buena · `▂▄▁▁` regular · `▂▁▁▁` débil |

Al abrir una conversación, la cabecera muestra el detalle completo, por ejemplo:

```
💬 Aliencool · no está en línea · visto hace 2 h · ▂▄▁▁ regular  SNR -13.2 dB · directo
```

El **SNR** sale de la base de nodos y el **RSSI** se toma de los paquetes que tu
nodo va escuchando. Si le escribís a alguien que no está en línea, BATTLEMESH te
avisa y el mensaje **queda en cola** para reenviarse cuando vuelva.

### Marcas de entrega

| Marca | Significado |
|---|---|
| ✓ | El mensaje **salió** de tu nodo |
| ✓✓ | El **nodo destino lo recibió** (confirmación del propio destinatario) |
| 🕓 | **En cola**: el destino no responde; se reenvía cuando vuelva a estar en línea |
| ✗ | Error al enviar |

En canales/broadcast, ✓✓ significa que el mensaje entró en la malla (un vecino
lo retransmitió), no que cada integrante lo haya leído.

> En los mensajes directos, el ✓✓ sólo aparece cuando **el propio destinatario**
> confirma. Si el mensaje lo retransmite un repetidor, o si sólo lo acusa el
> servidor MQTT, queda en ✓ — no se marca como entregado.
>
> Un mismo mensaje puede generar varias confirmaciones (del broker, de un
> repetidor y del destino). BATTLEMESH las escucha **todas**: la biblioteca de
> Meshtastic se queda sólo con la primera, y si esa vino del broker la
> confirmación real del destinatario se perdía.

**Señal atenuada:** las barras van a color únicamente cuando el nodo está en
línea. Si hace rato que no se lo escucha, se muestran grises: es el último valor
conocido, no la señal actual.

## Dónde guarda los datos

| Archivo | Contenido |
|---|---|
| `~/.local/share/mesh-tui/history.json` | Historial de conversaciones |
| `~/.local/share/mesh-tui/config.json` | Preferencias: tema, separación RF/MQTT, favoritos, secciones plegadas, sonido y nombres |
| `~/.local/share/mesh-tui/venv/` | Entorno con las dependencias |

Para borrar todo el historial de una: eliminá `history.json`.

## Notas y limitaciones

- El **reenvío de mensajes pendientes** ocurre a nivel de la aplicación:
  funciona mientras BATTLEMESH esté abierto. Un *store-and-forward*
  independiente de la PC requiere un nodo router con ese módulo del firmware.
- El **control de pantalla remoto** usa el comando `send_input_event` del
  firmware; su efecto depende de la versión y del modelo de nodo.
- Desarrollado y probado sobre Heltec WiFi LoRa 32 V2 con firmware Meshtastic
  2.7.x en Linux Mint 22.

## Compatibilidad de hardware

Funciona con **cualquier nodo Meshtastic conectado por USB** — no está atado a un
modelo. La configuración se genera automáticamente a partir de los protobuf de
Meshtastic, así que se adapta al firmware que tenga cada placa.

| Placa | Chip USB | Puerto típico | Detección |
|---|---|---|---|
| Heltec V3 / V4, Wireless Tracker | ESP32-S3 (USB nativo) | `/dev/ttyACM0` | automática |
| Heltec V2, T-Beam, T-Lora | CP2102 / CH340 | `/dev/ttyUSB0` | automática |
| Otros ESP32 | varios | `ttyUSB*` / `ttyACM*` | automática |

Si por algún motivo no detecta la placa, siempre podés indicar el puerto a mano:
`battlemesh /dev/ttyACM0`. Al conectar, BATTLEMESH muestra el modelo que reporta
el nodo (por ejemplo `HELTEC_V3`), para que confirmes con cuál estás hablando.

> Los nodos **nRF52** (RAK4631, T-Echo) no entran en la autodetección de la
> librería; con esos hay que pasar el puerto manualmente.

## Compilar el `.deb`

```bash
./build-deb.sh
```

Genera `battlemesh_<version>_all.deb` en el directorio actual.

## Historial de versiones

Ver [CHANGELOG.md](CHANGELOG.md).

## Licencia

MIT — ver [LICENSE](LICENSE).
