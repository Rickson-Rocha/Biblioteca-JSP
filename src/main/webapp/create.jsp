<%@ page import="data.DataBase" %><%--
  Created by IntelliJ IDEA.
  User: rickson
  Date: 31/10/2024
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastrar Livro</title>
</head>
<body>

<div>
    <h2>Cadastrar Livro</h2>

    <%
        String idParam = request.getParameter("id");
        String title = request.getParameter("titulo");
        String author = request.getParameter("autor");
        String editionParam = request.getParameter("edicao");
        String publisher = request.getParameter("editora");
        String yearParam = request.getParameter("ano");
        String cod = request.getParameter("codigo");
        String copiesParam = request.getParameter("exemplares");

        if (idParam == null) {
    %>

    <form action="create.jsp" method="POST">
        <div>
            <label for="id">ID</label>
            <input type="text" id="id" name="id" placeholder="Informe o ID do livro">
        </div>
        <div>
            <label for="title">Título</label>
            <input type="text" id="title" name="titulo" placeholder="Informe o título do livro">
        </div>
        <div>
            <label for="author">Autor</label>
            <input type="text" id="author" name="autor" placeholder="Digite o nome do autor">
        </div>
        <div>
            <label for="edition">Edição</label>
            <input type="text" id="edition" name="edicao" placeholder="Digite a edição do livro">
        </div>
        <div>
            <label for="publisher">Editora</label>
            <input type="text" id="publisher" name="editora" placeholder="Digite a editora do livro">
        </div>
        <div>
            <label for="year">Ano</label>
            <input type="text" id="year" name="ano" placeholder="Digite o ano de publicação">
        </div>
        <div>
            <label for="cod">Código</label>
            <input type="text" id="cod" name="codigo" placeholder="Digite o código do livro">
        </div>
        <div>
            <label for="copies">Exemplares</label>
            <input type="text" id="copies" name="exemplares" placeholder="Digite o número de exemplares">
        </div>
        <button type="submit">Enviar</button>
    </form>

    <%
    } else {
        try {

            int id = Integer.parseInt(idParam);
            int edition = Integer.parseInt(editionParam);
            int year = Integer.parseInt(yearParam);
            int copies = Integer.parseInt(copiesParam);

            DataBase dataBase = new DataBase();
            dataBase.createBook(id, title, author, publisher, edition, year, cod, copies);

            out.println("<div>Livro cadastrado com sucesso!</div>");
        } catch (NumberFormatException e) {
            out.println("<div>Erro ao cadastrar livro.</div>");
        }
    %>

    <div>
        <a href="menu.jsp">Voltar ao Menu</a>
    </div>

    <%
        }
    %>
</div>
</body>
</html>
