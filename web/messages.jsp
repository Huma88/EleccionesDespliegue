<%-- 
    Document   : messages
    Created on : 21-dic-2016, 0:13:03
    Author     : Aleja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="view/css/Base.css"/>
        <link rel="stylesheet" href="view/css/Styles.css"/>
        <title>Messages</title>
    </head>
    <body>
        <%
            Exception ex = (Exception) session.getAttribute("message");
        %>
        <table>
            <tr>
                <td>
                    Message:
                </td>
                <td>
                    <%= ex.getMessage()%>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="document.location.href = 'javascript:window.history.back();'" >Return</button>
                </td>
            </tr>
        </table>
    </body>
</html>
