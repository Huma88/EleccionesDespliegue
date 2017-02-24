<%@page import="model.User"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Votations</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="view/css/Base.css"/>
        <link rel="stylesheet" href="view/css/Styles.css"/>
    </head>
    <body>
        <div>
            <h1>Choose a political party</h1>
            <%  /*User user = (User) session.getAttribute("user");*/%>
            <!--<p>Me han pasado = <%/*= user*/%> </p>-->
            <!--/*request.getRequestDispatcher("destino.jsp").forward(request, response);*/ %>-->
            <form action="VotationServlet">
                <img src="view/img/ppsoe.jpg" alt="ppsoeLogo"/>
                <input type="radio" id="ppsoe" name="politicalParty" value="ppsoe" checked="checked"/>
                <img src="view/img/ciudadanos.jpg" alt="ciudadanosLogo"/>
                <input type="radio" id="ciudadanos" name="politicalParty" value="ciudadanos"/>
                <img src="view/img/podemos.jpg" alt="podemosLogo"/>
                <input type="radio" id="podemos" name="politicalParty" value="podemos"/>
                <img src="view/img/others.jpg" alt="othersLogo"/>
                <input type="radio" id="others" name="politicalParty" value="others"/>
                <br/>
                <button type="submit" id="sendVote">Send Vote</button>
                <button id="back" type="button" onclick="document.location.href = 'view/mainMenu.jsp'" >Back</button>
            </form>
        </div>
    </body>
</html>
