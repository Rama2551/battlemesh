# Historial de versiones

## 1.5.0

- **Panel de configuración en castellano**: los parámetros dejan de mostrarse con
  su nombre técnico (`screen_on_secs`, `hop_limit`…) y pasan a tener un nombre
  claro y una explicación de qué hacen, tomada de la documentación oficial de
  Meshtastic. El nombre técnico queda visible en chico, para poder buscarlo.
- Títulos de sección traducidos y avisos ⚠ en las opciones delicadas.

## 1.4.3

- **Corregida la presencia**: un nodo con el que estabas chateando podía figurar
  como *nunca escuchado*. La presencia sólo miraba los anuncios de identidad;
  ahora cuenta **cualquier** paquete recibido, incluidos los mensajes.
- **Corregida la clasificación RF/MQTT**: los nodos que figuran en la base de
  datos pero que nunca escuchaste ya no aparecen en *Por radio*.

## 1.4.2

- **Confirmaciones de entrega más fiables**: un mensaje puede generar varias
  confirmaciones (del servidor MQTT, de un repetidor y del destinatario). Antes
  sólo se veía la primera —normalmente la del broker— y la real del destino se
  descartaba. Ahora se siguen todas, y el ✓✓ aparece cuando confirma el
  destinatario, sin importar en qué orden lleguen.

## 1.4.1

- **Corregido el doble check falso**: sólo se marca ✓✓ cuando confirma el propio
  destinatario. Antes, el ACK que genera un repetidor al retransmitir se tomaba
  como entrega, y un nodo apagado aparecía como si hubiera recibido el mensaje.
- **Corregida la señal desactualizada**: las barras van a color sólo si el nodo
  está en línea; si hace rato que no se lo escucha se muestran atenuadas y el
  detalle aclara que es la *última señal* conocida.

## 1.4.0

- **Lista separada en 📻 RF y 🌐 MQTT**, en secciones plegables que pueden estar
  abiertas a la vez. Se activa o desactiva desde `F9` → 🖥 Programa.
- **Favoritos ★** con `F10`: quedan siempre arriba de la lista.
- **Orden**: favoritos, luego los nodos en línea, y el resto por última vez visto.
- Nueva pestaña **🖥 Programa** en `F9` con las preferencias locales.
- **21 temas de color** a elección.
- Todo (tema, separación, favoritos, secciones plegadas, sonido y nombres) se
  guarda en la PC y se recupera al abrir.

## 1.3.0

- **Autoactualización**: `battlemesh --update` descarga e instala la última
  versión, validándola antes y dejando copia de respaldo.
- `battlemesh --version` y `battlemesh --help`.
- Estos comandos funcionan aunque la máquina todavía no tenga las dependencias.

## 1.2.0

- **Presencia por nodo**: en línea / visto hace poco / no está en línea.
- **Calidad de enlace** con marcador de señal, SNR y RSSI en dB, y saltos.
- Aviso al escribirle a un nodo que no está en línea (el mensaje queda en cola).
- `F4` alterna nombres largos y cortos; la preferencia se recuerda.

## 1.1.1

- Compatibilidad explícita con Heltec V3/V4 y otros nodos (`ttyACM`).
- Muestra el modelo de hardware al conectar y lista los puertos si no encuentra
  la placa.

## 1.1.0

- **Panel de configuración del nodo** (`F9`): todos los parámetros de Meshtastic
  en pestañas, con modo Básico/Avanzado, carga de la configuración actual del
  aparato y validación de los límites del firmware.

## 1.0.0

- Chat de canales/grupos y mensajes directos, con lista lateral y mouse.
- Doble check de entrega y reenvío automático de pendientes.
- Buscador de nodos, sonido de notificación e historial persistente.
- Control remoto de la pantalla del nodo.
- Autodetección de la placa LoRa, paquete `.deb` y script portátil.
