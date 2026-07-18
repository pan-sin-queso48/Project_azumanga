# Project_azumanga (Hyprland Dotfiles)

¡Hola! Esta es mi configuración personal de Hyprland para el día a día. A diferencia de la mayoría de setups que encuentras en internet, este proyecto **huye por completo del minimalismo clásico** de Hyprland. Está diseñado priorizando una personalización visual completa, comodidad y un entorno lleno de vida basado en mis gustos personales.

Esta primera versión es completamente **estable y funcional para el uso diario**.

## ⚠️ Notas importantes antes de usar

- **No es un instalador automático:** Esta configuración está hecha a medida para mi laptop y mi comodidad, por lo que si decides usarla, tendrás que revisar los archivos y adaptarlos a tu hardware.
- **Estructura modular:** Para mantener el orden, la configuración principal `hyprland.conf` está dividida en submódulos numerados dentro de la carpeta `conf.d/` (animaciones, decoración, reglas de ventanas, bindings, etc.).

## 🖼️ Scripts incluidos
El repositorio incluye un script en Bash llamado `cambiar_fondo.sh` que se encarga de seleccionar y rotar de forma aleatoria tus fondos de pantalla cada 5 minutos usando `swaybg`y un spript para tomar capturas de pantalla con grim

*Nota: Cuenta con un retraso inicial (`sleep 2`) para garantizar que el entorno gráfico y los monitores hayan cargado por completo antes de aplicar el fondo, asegurando que sea totalmente estable.*

## 📂 Requisitos básicos utilizados
* **Window Manager:** Hyprland
* **Editor preferido para configuraciones:** Kate
* **Wallpaper daemon:** swaybg
* **Utilidades de terminal:** bash, find, shuf

---

## ⚖️ Créditos y Derechos de Autor (Copyright Notice)

- **Temática y Nombre:** El nombre "Project_azumanga" y la temática general del entorno son un homenaje al manga y anime *Azumanga Daioh* creado por Kiyohiko Azuma. Este es un proyecto de fan sin fines de lucro.
- **Fondos de Pantalla:** Las imágenes incluidas en la carpeta `fondos` fueron recopiladas de Pinterest con fines puramente estéticos y de personalización personal. **No poseo los derechos de autor de estas ilustraciones.** Pertenecen a sus respectivos creadores originales y/o a los titulares de la franquicia. 
- Si eres el autor de alguna de las imágenes y deseas que sea retirada del repositorio, por favor abre un *Issue* o ponte en contacto conmigo y la eliminaré de inmediato.
