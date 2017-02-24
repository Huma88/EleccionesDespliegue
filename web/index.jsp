<%-- 
    Document   : indexs
    Created on : 12-dic-2016, 22:05:32
    Author     : Aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="view/css/Base.css"/>
        <link rel="stylesheet" href="view/css/Styles.css"/>
    </head>
    <body>
        <article>
            <section>
                <form action="IndexDispatcher">
                    <input id="nif" name="nif" type="text"/>
                    <br/>
                    <input id="password" name="password" type="text"/>
                    <br/>
                    <button id="Login" type="submit" name="submit" value="login">Log in</button>
                    <br/>
                    <button id="registration" type="submit" name="submit" value="registration">Registration</button>
                    <br/>
                    <button id="census" type="submit" name="submit" value="census">Electoral Census</button>
                </form>
            </section>
        </article>
    </body>
</html>
