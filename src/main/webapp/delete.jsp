<%--
  Created by IntelliJ IDEA.
  User: rickson
  Date: 31/10/2024
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.DataBase" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Deletar Livro</title>
</head>
<body>

<div>
    <h2>Deletar Livro</h2>

    <%
        String titleBook = request.getParameter("title");

        if (titleBook == null) {
    %>

    <form action="delete.jsp" method="POST">
        <div>
            <label for="title">Título</label>
            <input type="text" id="title" name="title" placeholder="Informe  o nome do livro a ser deletado">
        </div>
        <button type="submit">Excluir</button>
    </form>

    <%
    } else {
        DataBase dataBase = new DataBase();
        dataBase.deleteBook(titleBook);
    %>

    <div>
        Livro deletado com sucesso!
        <a href="menu.jsp">Voltar ao Menu</a>
    </div>

    <%
        }
    %>
</div>
</body>
</html>
