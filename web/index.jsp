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
        
<!--        <article>
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
        </article>-->

 <div id="principal">
            <div id="cabecera">
                <img src="view/img/cabecera.png" alt="" width="100%" height="auto" /> 
            </div>

            <div id="info">
                <div id="titulo">
                    <h2>Registro Votante / Acceso a Votar</h2>
                </div>

                <br> <br>

                <div id="conteninfo">
                    <div id="formCompleto"> 
                        <div id="formularioLogin"> 


                            <form action="IndexDispatcher">
                                <table class="inicio" align="center">
                                    <tr>
                                        <td class="labelI"><label>NIF</label></td>
                                        <td class="inputI"><input id="nif" name="nif" type="text" autocomplete="off"/></td>
                                    </tr>
                                    <tr>
                                        <td class="labelI"><label>CLAVE</label></td>
                                        <td class="inputI"><input id="password" name="password" type="text" autocomplete="off"/></td>
                                        
                                    </tr>
                                </table>
                                <br>
                                <table align="center">
                                    <tr>
                                        <td>
                                            <button id="Login" type="submit" name="submit" class="button_habilitado" value="login">Log in</button>
                                            <button id="registration" type="submit" name="submit" class="button_habilitado" value="registration">Registration</button>
                                            <button id="census" type="submit" name="submit" class="button_habilitado" value="census">Electoral Census</button>
<!--                                            <input type="submit" name="boton" id="darAlta" class="button_habilitado" disabled="true" value="Alta" />
                                            <input type="submit" name="boton" id="login" class="button_habilitado" disabled="true" value="Login" />-->
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>  

                    </div>  
                </div>

            </div>

            <div id="pie">
                <img src="view/img/pie.png" alt="" width="100%" height="auto" /> 

            </div>

        </div>
        

        
    </body>
</html>
