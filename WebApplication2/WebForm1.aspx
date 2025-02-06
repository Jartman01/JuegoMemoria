<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" Async="true"  %>


<!DOCTYPE html>
<script>
    function startCountdown() {
        let seconds = 3;
        let messageLabel = document.getElementById('<%= lblMessage.ClientID %>');

        function updateMessage() {
            if (seconds > 0) {
                messageLabel.innerText = "Pareja incorrecta. Inténtalo de nuevo en " + seconds + " segundos...";
                seconds--;
                setTimeout(updateMessage, 1000);
            } else {
                messageLabel.innerText = ""; // Ocultar mensaje después del conteo
            }
        }

        updateMessage(); // Iniciar cuenta regresiva
    }
</script>

<html>
<head runat="server">
    <title>Memorama</title>
    <style>
        .grid { display: grid; grid-template-columns: repeat(4, 100px); gap: 10px; }
        .card { width: 100px; height: 100px; font-size: 24px; }
    </style>
    <script>
        function flipCard(button, index) {
            button.innerText = document.getElementById('hidden' + index).value;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="grid" id="gameBoard">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>
        <asp:Button ID="RestartButton" runat="server" Text="Reiniciar Juego" OnClick="RestartGame_Click" />
        <asp:Label ID="lblMessage" runat="server" CssClass="error-message" ForeColor="Red"></asp:Label>
<br />
<asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
