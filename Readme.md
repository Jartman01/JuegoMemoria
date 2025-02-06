# Juego de Memoria

## Descripción
"Juego de Memoria" es una implementación sencilla de un juego de memoria utilizando HTML, CSS y JavaScript/jQuery. 
El juego consiste en voltear cartas para encontrar pares idénticos. Las cartas que se emparejan permanecen descubiertas, 
mientras que las que no coinciden se ocultan después de un temporizador de 3 segundos con un contador regresivo. 
Al finalizar el juego (cuando se han emparejado todas las cartas), se muestra un botón para reiniciar la partida.

## Características
- **Interfaz Interactiva:** Tablero de 4x4 cartas que se generan y renderizan dinámicamente.
- **Comparación de Pares:** Cuando se voltean dos cartas, se comprueba si son iguales.
- **Temporizador con Contador:** Si las cartas no coinciden, se bloquea la interacción durante 3 segundos, mostrando un contador regresivo.
- **Permanencia de Pares Correctos:** Los pares encontrados permanecen descubiertos y no se pueden volver a seleccionar.
- **Reinicio del Juego:** Al completar el juego, aparece un botón para reiniciar la partida.

## Tecnologías Utilizadas
- **HTML:** Estructura la interfaz del juego.
- **CSS:** Define la apariencia visual de las cartas y el tablero.
- **JavaScript & jQuery:** Controlan la lógica del juego, el temporizador, la manipulación del DOM y la interacción del usuario.

## Cómo Jugar
1. **Abrir el Juego:** Abre el archivo `version2` en tu navegador.
2. **Voltear Cartas:** Haz clic en las cartas para voltearlas. El objetivo es encontrar los pares coincidentes.
3. **Comparación:**  
   - Si dos cartas volteadas coinciden, permanecen descubiertas.
   - Si no coinciden, se muestra un mensaje con un contador regresivo de 3 segundos durante el cual el juego queda bloqueado.
4. **Final del Juego:** Cuando todas las cartas han sido emparejadas, aparece un botón "Reiniciar Juego" para comenzar una nueva partida.

## Instalación y Uso
1. **Clonar o Descargar:** Descarga o clona el repositorio en tu equipo.
2. **Abrir el Archivo:** Ubica el archivo `version2` y ábrelo en cualquier navegador web moderno.