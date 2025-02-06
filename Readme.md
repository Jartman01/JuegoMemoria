# Juego de Memoria

## Descripci�n
"Juego de Memoria" es una implementaci�n sencilla de un juego de memoria utilizando HTML, CSS y JavaScript/jQuery. 
El juego consiste en voltear cartas para encontrar pares id�nticos. Las cartas que se emparejan permanecen descubiertas, 
mientras que las que no coinciden se ocultan despu�s de un temporizador de 3 segundos con un contador regresivo. 
Al finalizar el juego (cuando se han emparejado todas las cartas), se muestra un bot�n para reiniciar la partida.

## Caracter�sticas
- **Interfaz Interactiva:** Tablero de 4x4 cartas que se generan y renderizan din�micamente.
- **Comparaci�n de Pares:** Cuando se voltean dos cartas, se comprueba si son iguales.
- **Temporizador con Contador:** Si las cartas no coinciden, se bloquea la interacci�n durante 3 segundos, mostrando un contador regresivo.
- **Permanencia de Pares Correctos:** Los pares encontrados permanecen descubiertos y no se pueden volver a seleccionar.
- **Reinicio del Juego:** Al completar el juego, aparece un bot�n para reiniciar la partida.

## Tecnolog�as Utilizadas
- **HTML:** Estructura la interfaz del juego.
- **CSS:** Define la apariencia visual de las cartas y el tablero.
- **JavaScript & jQuery:** Controlan la l�gica del juego, el temporizador, la manipulaci�n del DOM y la interacci�n del usuario.

## C�mo Jugar
1. **Abrir el Juego:** Abre el archivo `version2` en tu navegador.
2. **Voltear Cartas:** Haz clic en las cartas para voltearlas. El objetivo es encontrar los pares coincidentes.
3. **Comparaci�n:**  
   - Si dos cartas volteadas coinciden, permanecen descubiertas.
   - Si no coinciden, se muestra un mensaje con un contador regresivo de 3 segundos durante el cual el juego queda bloqueado.
4. **Final del Juego:** Cuando todas las cartas han sido emparejadas, aparece un bot�n "Reiniciar Juego" para comenzar una nueva partida.

## Instalaci�n y Uso
1. **Clonar o Descargar:** Descarga o clona el repositorio en tu equipo.
2. **Abrir el Archivo:** Ubica el archivo `version2` y �brelo en cualquier navegador web moderno.