<%@ page import="data.DataBase" %>
<%@ page import="model.Book" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: rickson
  Date: 31/10/2024
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Buscar livro</title>
</head>
<body>

<div>
    <h2>Consulte um livro </h2>

    <form action="read.jsp" method="POST">
        <div>
            <label for="titulo">Título</label>
            <input type="text" id="titulo" name="titulo" placeholder="Digite o título do livro">
        </div>
        <button type="submit">Consultar</button>
    </form>

    <div>
        <%
            String titulo = request.getParameter("titulo");
            if (titulo != null) {
                DataBase dataBase = new DataBase();
                ArrayList<Book> books = dataBase.getBookByTitle(titulo);

                if (books.isEmpty()) {
        %>
        <div>
         Não existe livro com esse título na base de dados"<%= titulo %>".
        </div>
        <%
        } else {
        %>
        <ul>
            <%
                for (Book b : books) {
            %>
            <li>
                <strong>Título:</strong> <%= b.getTitle() %> <br>
                <strong>Autor:</strong> <%= b.getAuthor() %> <br>
                <strong>Exemplares:</strong> <%= b.getCopies() %>
            </li>
            <%
                }
            %>
        </ul>
        <%
                }
            }
        %>
    </div>
</div>

</body>
</html>
