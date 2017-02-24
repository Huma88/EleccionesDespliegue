<%-- 
    Document   : ElectoralCensus
    Created on : 15-dic-2016, 20:51:58
    Author     : Aleja
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.PoliticalParty"%>
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
                    Name
                </td>
                <td>
                    Logo
                </td>
                <td>
                    Votes
                </td>
            </tr>
            <%
                ArrayList<PoliticalParty> scrutiny = (ArrayList) session.getAttribute("scrutiny");
                Iterator It = scrutiny.iterator();
                PoliticalParty party;
                while (It.hasNext()) {
                    party = ((PoliticalParty) It.next());
            %>
            <tr>
                <td>
                    <%= party.getName()%>
                </td>
                <td>
                    <img src="view/img/<%= party.getLogo()%>" alt="logo" />
                </td>
                <td>
                    <%= party.getVotes()%>
                </td>
            </tr>
            <%
                };
            %>

        </table>
    </body>
</html>
