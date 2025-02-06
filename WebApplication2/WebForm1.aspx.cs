using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private static readonly string[] Images = { "A", "A", "B", "B", "C", "C", "D", "D", "E", "E", "F", "F", "G", "G", "H", "H" };
        private List<string> shuffledCards;
        private List<int> flippedCards;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShuffleCards();
                Session["Cards"] = shuffledCards;
                Session["Revealed"] = new bool[16];
                Session["Flipped"] = new List<int>();
                Session["Locked"] = false; // Estado inicial desbloqueado
            }
            else
            {
                shuffledCards = (List<string>)Session["Cards"];
                flippedCards = (List<int>)Session["Flipped"];
            }

            // Ejecutar el método para ocultar cartas después del retraso
            if (Request["__EVENTTARGET"] == "HideCards")
            {
                HideMismatchedCards();
            }

            RenderBoard();

        }
        private void HideMismatchedCards()
        {
            bool[] revealed = (bool[])Session["Revealed"];
            List<int> flippedCards = (List<int>)Session["Flipped"];

            if (flippedCards.Count == 2)
            {
                revealed[flippedCards[0]] = false;
                revealed[flippedCards[1]] = false;
                flippedCards.Clear();
            }

            Session["Revealed"] = revealed;
            Session["Flipped"] = flippedCards;
            Session["Locked"] = false; // Desbloquea el juego

            lblMessage.Text = ""; // Oculta mensaje
            RenderBoard();
        }



        private void ShuffleCards()
        {
            Random rnd = new Random();
            shuffledCards = Images.OrderBy(x => rnd.Next()).ToList();
        }

        private void RenderBoard()
        {
            bool[] revealed = (bool[])Session["Revealed"];
            bool locked = (bool)Session["Locked"];
            PlaceHolder1.Controls.Clear();

            for (int i = 0; i < 16; i++)
            {
                Button btn = new Button
                {
                    ID = "btn" + i,
                    CssClass = "card",
                    Text = revealed[i] ? shuffledCards[i] : "?",
                    CommandArgument = i.ToString(),
                    UseSubmitBehavior = false,
                    //Enabled = !locked // Deshabilitar botones si el juego está bloqueado
                };

                btn.Click += new EventHandler(Card_Click);
                PlaceHolder1.Controls.Add(btn);
            }
        }


        protected async void Card_Click(object sender, EventArgs e)
        {
            if ((bool?)Session["Locked"] == true) return; // Evita que se sigan volteando cartas mientras está bloqueado

            Button clickedButton = (Button)sender;
            int index = int.Parse(clickedButton.CommandArgument);
            bool[] revealed = (bool[])Session["Revealed"];
            flippedCards = (List<int>)Session["Flipped"];

            if (flippedCards.Contains(index)) return; // Evitar doble clic en la misma carta

            flippedCards.Add(index);
            revealed[index] = true;

            Session["Revealed"] = revealed;
            Session["Flipped"] = flippedCards;
            RenderBoard();

            if (flippedCards.Count == 2)
            {
                Session["Locked"] = true; // Bloquea el juego mientras se comparan
                int first = flippedCards[0];
                int second = flippedCards[1];

                if (shuffledCards[first] != shuffledCards[second])
                {
                    lblMessage.Text = "Pareja incorrecta. Inténtalo de nuevo en 3 segundos...";

                    // Llamar al script para mostrar el contador y refrescar después de 3 segundos
                    string script = "startCountdown(); setTimeout(function() { __doPostBack('HideCards', ''); }, 3000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideCards", script, true);
                }
                else
                {
                    flippedCards.Clear(); // Si es correcta, permitir seguir jugando
                    Session["Flipped"] = flippedCards;
                    Session["Locked"] = false;
                }
            }
        }





        protected void RestartGame_Click(object sender, EventArgs e)
        {
            ShuffleCards();
            Session["Cards"] = shuffledCards;
            Session["Revealed"] = new bool[16];
            Session["Flipped"] = new List<int>();
            RenderBoard();
        }
    }
}