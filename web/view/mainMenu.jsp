<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>e-Spanish Vote main menu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Base.css"/>
        <link rel="stylesheet" href="css/Styles.css"/>
    </head>
    <body>
        <div id="buttons">
            <form action="../MainMenuDispatcher">
            <button id="vote" type="submit" name="submit" value="vote" >Vote</button>
            <button id="unsubscribe" type="submit" name="submit" value="unsubscribe">Unsubscribe</button>
            <button id="scrunityClose" type="submit" name="submit" value="scrutinyClose">Scrutiny Close</button>
            <button id="logout" type="button" onclick="document.location.href ='../index.jsp'" >Log out</button>
            </form>
        </div>
    </body>
</html>
