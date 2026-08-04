████  ████   ███    ███ █████  ███  █████
█░░░█ █░░░█ █ ░░█    █░░█░░░░░█ ░░░  ░█░░░
████░░████░░█░ ░█░   █░░████░░█░ ░░░  █░░░░
█░░░░ █░░█░ █░░ █░█  █░░█░░░░ █░░     █░░
█░░░░░█░░░█░ ███ ░░██ ░░█████░ ███    █░░
 ░░    ░░  ░  ░░░ ░ ░░ ░ ░░░░░  ░░░    ░░
  ░     ░   ░  ░░░   ░░   ░░░░░  ░░░    ░
  
 ███  █████ █   █ █   █  ███  █   █  ███   ███ 
█ ░░█  ░░█░░█░  █░██ ██░█ ░░█ ██  █░█ ░░░ █ ░░█ 
█████░  █░░░█░░ █░█░█ █░█████░█░█ █░█░ ██░█████░ 
█░░░█░░█ ░ ░█░░ █░█░░░█░█░░░█░█░░██░█░░ █░█░░░█░░ 
█░░░█░█████  ███ ░█░░ █░█░░░█░█░░ █░░███ ░█░░░█░░ 
 ░░  ░░░░░░░  ░░░ ░░░  ░░░░  ░░░░  ░░ ░░░ ░░░  ░░ 
  ░   ░ ░░░░░  ░░░  ░   ░ ░   ░ ░   ░  ░░░  ░   ░ 
  
¡Hola! Esta es mi configuración personal de Hyprland para el día a día. A diferencia de la mayoría de setups que encuentras en internet, este proyecto **huye por completo del minimalismo clásico** de Hyprland. Está diseñado priorizando una personalización visual completa, comodidad y un entorno lleno de vida basado en mis gustos personales de anime.

En adelante se vienen actualizaciones pequeñas agregando una o dos funciones nuevas, pero todo con tal de que quede estable cada funcion y que hasta yo que cambio de ditribucion cada cierto tiempo pueda instalarlo sin mayor preblema 

Tambien incluye algun que otra imagen o fondo de Yotsuba&!, otra obra de Kiyohiko Azuma y tambien de otros animes del genero "slice of life" como:k-on, lucky star y nichijou pero en su mayoria hay Azumanga Daioh

## ⚠️ Notas importantes antes de usar

- **No es un instalador automático:** Esta configuración está hecha a medida para mi laptop y mi comodidad, por lo que si decides usarla, tendrás que revisar los archivos y adaptarlos a tu hardware tambien mover archivos en donde corresponde y recomiendo usar "noto sans mono CJK JP" para que se vean los caracteres de la Waybar.
- **Estructura modular:** Para mantener el orden, la configuración principal `hyprland.conf` está dividida en submódulos numerados dentro de la carpeta `conf.d/` (animaciones, decoración, reglas de ventanas, bindings, etc.).
- **Más notas:** Esta configuracion originalmente fue echo en debian 13 y con hyprland 0.53, las versiones 1.0 y 1.1 fueron configuradas en hyprland 0.53, de ahi en adelante sera configurado en hyprland 0.56 y puesto a prueba en Arch.

## 🖼️ Scripts incluidos
El repositorio incluye un script en Bash llamado `cambiar_fondo.sh` que se encarga de seleccionar y rotar de forma aleatoria tus fondos de pantalla cada 5 minutos usando `swaybg` y `hyprpaper`, y un spript para tomar capturas de pantalla con `grim`

>**Nota**: Cuenta con un retraso inicial (`sleep 2`) para garantizar que el entorno gráfico y los monitores hayan cargado por completo antes de aplicar el fondo, asegurando que sea totalmente estable.*

## 📂 Requisitos básicos utilizados
* **Window Manager:** Hyprland
* **Editor preferido para configuraciones:** Kate
* **Wallpaper daemon:** swaybg y hyprpaper
* **Utilidades de terminal:** bash, find, shuf
* **Fuente:** noto sans mono CJK
* **No se pero es para el fastfetch:** imagemagick
* **Navegador:** zen browser
>**Nota:** Yo uso zen porque, aunque el proyecto se base en escapar del minimalismo, por lo que mis monitores no son tan grandes, la funcion del modo compacto me a ayudado que se aprovece la mayor cantidad de espacio y ver mas el contenido. Yo lo recomiendo por que me a gustado por sus funciones y porque esta hecho con el mismo motor de Firefox, pueden ver mas informacion en su pagina oficial https://zen-browser.app/welcome/

## ⚖️ Créditos y Derechos de Autor (Copyright Notice)

- **Temática y Nombre:** El nombre "Project_azumanga" y la temática general del entorno son un homenaje al manga y anime *Azumanga Daioh* creado por Kiyohiko Azuma. Este es un proyecto de fan sin fines de lucro.
- **Fondos de Pantalla:** Las imágenes incluidas en la carpeta `fondos` y `fastfetch_logos` fueron recopiladas de Pinterest con fines puramente estéticos y de personalización personal. **No poseo los derechos de autor de estas ilustraciones.** Pertenecen a sus respectivos creadores originales y/o a los titulares de las franquicias. 
- Si eres el autor de alguna de las imágenes y deseas que sea retirada del repositorio, por favor abre un *Issue* o ponte en contacto conmigo y la eliminaré de inmediato.

## Funcion de mpv
Si quieres escuchar música sin tener que abrir el navegador. He preparado una configuración de mpv para que puedan escuchar música en modo aleatorio y solo oprimiendo “super + Y” o “super + U”. Con dos playlist, una es mi playlist de lo que a mí me gusta, y la otra es para darle más ambiente al escritorio, con músicas de mi selección y gusto, pero si quieres escuchar de tu propia playlist puedes modificar  uno de los dos archivos en donde trae el script, cambia el URL de la playlist que ya está por el URL de tu playlist
>**Nota:**el archivo `playlist.sh` es mi playlist que si quieres puedes escucharlo y se ejecuta con `super + Y` y el archivo `algo.sh` es la playlist que solo contiene musica japonesa de mi seleccion y gusto y ejecuta con `super + U`, para parar o reanundar es con `super + P`, para cambiar a la siguiente cancion es con `super + O` y para cambiar a la anterior es con `super + I`, y si queres puedes cambiarlo en en archivo `07-bindings.conf` 

**Cosas por instalar:** 

* `mpv`
* `yt-dlp`
* `playerctl`
* `mpv-mpris`

**Aviso:** Pero antes de eso, recuerda que no es un instalador automático, para que funcione asegúrate de que sean ejecutables los archivos `playlist.sh` y `algo.sh`, debes mover los archivos `playlist.sh` y `algo.sh` a esta dirección: `~/.local/bin` ejecutar estos comandos: `mkdir -p ~/.config/mpv/scripts` y  `ln -s /usr/lib64/mpv/mpris.so ~/.config/mpv/scripts/mpris.so` para que funciene los atajos de playerctl funcione correctamente y para que el sistema reconosca los datos y la musica 

## 📦 Historial de versiones

| Versión |      Fecha      |   Cambios                                                   |
|---------|-----------------|-------------------------------------------------------------|
| v1.0.0  | 17 Julio 2026   | Primera versión publicada.                                  |
| v1.1.0  | 24 Julio 2026   | Mejoras en los atajos de teclado y configuración de Waybar. |
| v1.1.1  | 28 Julio 2026   | Actualizado para hyprland 0.56 y probado en Arch Linux      |

## 🖥️ Compatibilidad

| Distribución | Versión         | Estado      | Notas                                               |
|--------------|-----------------|-------------|-----------------------------------------------------|
| Debian       | 13 (Trixie)     | ✅ Funciona  | Distribución principal donde hize la configuración  |
| Fedora       | Fedora 44       | ⏳ En pausa  | No esta disponible hyprland en los paquetes oficiales de fedora en la versión fedora 44, pero probare en otra versión anterior de Fedora |
| Arch Linux   | Linux 7.1.5-arch1-1 | ✅ Funciona | Si funciona, pero se tuvieron que hacer cambios pequeños y se adapto la configuración a hyprland 0.56 |
| NixOS        | -               | ⏳ Pendiente | Planeado para el futuro (ya cuando sea mas avanzado)|
| openSUSE     | openSUSE Tumbleweed | ✅ Funciona | Funciona pero con algunos arreglos |

## Notas para openSUSE
Para esta Distribución se tuvieron que hacer cambios y les recomiendo instalar: **qt5-wayland**, **qt6-wayland**, **kf6-kio** y **xdg-desktop-portal-gtk**
En openSUSE no se podia instalar establemente `xdg-desktop-portal-hyprland` y `hyprlauncher` no se porque pero por eso use alternativas como el menu de `rofi` en ves de `hyprlauncher `






