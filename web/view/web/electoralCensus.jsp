<%-- 
    Document   : ElectoralCensus
    Created on : 15-dic-2016, 20:51:58
    Author     : Aleja
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electoral Census</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="view/css/Base.css"/>
        <link rel="stylesheet" href="view/css/Styles.css"/>
    </head>

    <body>
        <!--<h1>Hello World!</h1>-->
        <button id="logout" type="button" onclick="document.location.href = 'index.jsp'" >Return</button>
        <table>
            <tr>
                <td>
                    NIF
                </td>
                <td>
                    Voted
                </td>
            </tr>
            <%
                ArrayList<User> census = (ArrayList) session.getAttribute("census");
                Iterator It = census.iterator();
                User user;
                while (It.hasNext()) {
                    user = ((User) It.next());
            %>
            <tr>
                <td>
                    <%= user.getNif()%>
                </td>
                <td>
                    <%= user.getVoted()%>
                </td>
            </tr>
            <%
                };
            %>

        </table>
    </body>
</html>
