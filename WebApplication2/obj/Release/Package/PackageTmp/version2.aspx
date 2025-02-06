<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="version2.aspx.cs" Inherits="WebApplication2.version2" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Juego de Memoria</title>
  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
    }
    .tablero {
      display: grid;
      grid-template-columns: repeat(4, 100px);
      gap: 10px;
      justify-content: center;
      margin-top: 20px;
    }
    .card {
      width: 100px;
      height: 100px;
      font-size: 24px;
      font-weight: bold;
      text-align: center;
      line-height: 100px;
      background-color: #007BFF;
      color: white;
      border: none;
      cursor: pointer;
    }
    .card.flipped {
      background-color: #fff;
      color: black;
      cursor: default;
    }
    .card.matched {
      background-color: #00c853; /* Verde para cartas correctas */
      color: black;
      cursor: default;
    }
    .mensaje {
      margin-top: 20px;
      font-size: 18px;
      color: red;
    }
    #restart-container {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <h1>Juego de Memoria</h1>
  <!-- Mensaje de error y contador -->
  <div class="mensaje" id="mensaje"></div>
  <!-- Tablero de cartas -->
  <div class="tablero" id="tablero"></div>
  <!-- Contenedor para el botón de reinicio (se muestra al terminar el juego) -->
  <div id="restart-container"></div>
  
  <script>
      $(document).ready(function () {
          // Definición de las cartas (8 pares, total 16 cartas)
          let images = ["A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H"];

          let barajarcartas = [];    // Cartas barajadas
          let arribacartas = [];     // Índices de las cartas volteadas actualmente
          let coinciden = [];     // Índices de las cartas que ya han sido emparejadas
          let locked = false;        // Variable para bloquear el tablero mientras se ejecuta el temporizador

          // Función para barajar las cartas
          function barajar(array) {
              return array.sort(() => Math.random() - 0.5);
          }

          // Función para renderizar el tablero
          function CargarTablero() {
              let tablero = $("#tablero");
              tablero.empty();
              // Recorremos cada carta para dibujarla
              barajarcartas.forEach((value, index) => {
                  let cardClass = "card";
                  let text = "?";
                  // Si la carta está volteada o ya fue emparejada, se muestra su valor
                  if (arribacartas.includes(index) || coinciden.includes(index)) {
                      cardClass += " flipped";
                      text = barajarcartas[index];
                  }
                  // Si la carta ya está emparejada, se le añade una clase especial
                  if (coinciden.includes(index)) {
                      cardClass += " matched";
                  }
                  tablero.append(`<button class="${cardClass}" data-index="${index}">${text}</button>`);
              });

              // Verificar si el juego ha terminado (todas las cartas han sido emparejadas)
              if (coinciden.length === barajarcartas.length) {
                  $("#restart-container").html('<button id="restart-button">Reiniciar Juego</button>');
              } else {
                  $("#restart-container").html('<button id="restart-button">Reiniciar Juego</button>');
              }
          }

          // Función para iniciar o reiniciar el juego
          function ReiniciarJuego() {
              barajarcartas = barajar([...images]);  // Barajamos las cartas
              arribacartas = [];
              coinciden = [];
              locked = false;
              $("#mensaje").text("");
              CargarTablero();
          }

          // Evento al hacer clic en una carta (que no esté ya volteada ni emparejada)
          $(document).on("click", ".card:not(.flipped):not(.matched)", function () {
              if (locked) return;  // Si el juego está bloqueado, no se hace nada

              let index = $(this).data("index");
              if (arribacartas.length < 2 && !arribacartas.includes(index)) {
                  arribacartas.push(index);
                  CargarTablero();
              }

              // Si se han volteado dos cartas, se comparan
              if (arribacartas.length === 2) {
                  let first = arribacartas[0];
                  let second = arribacartas[1];

                  if (barajarcartas[first] === barajarcartas[second]) {
                      // Si las cartas coinciden, se agregan a la lista de emparejadas
                      coinciden.push(first, second);
                      arribacartas = [];
                      CargarTablero();
                  } else {
                      // Si no coinciden, se bloquea el juego y se muestra el contador
                      locked = true;
                      let countdown = 3;
                      $("#mensaje").text(`Pareja incorrecta. Inténtalo en ${countdown} segundos...`);

                      let interval = setInterval(() => {
                          countdown--;
                          $("#mensaje").text(`Pareja incorrecta. Inténtalo en ${countdown} segundos...`);
                          if (countdown === 0) {
                              clearInterval(interval);
                              $("#mensaje").text("");
                              arribacartas = [];
                              locked = false;
                              CargarTablero();
                          }
                      }, 1000);
                  }
              }
          });

          // Evento para el botón de reinicio que aparece al terminar el juego
          $(document).on("click", "#restart-button", function () {
              ReiniciarJuego();
          });

          // Iniciar el juego al cargar la página
          ReiniciarJuego();
      });
  </script>
</body>
</html>


