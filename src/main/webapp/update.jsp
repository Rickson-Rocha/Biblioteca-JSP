<%@ page import="data.DataBase" %><%--
  Created by IntelliJ IDEA.
  User: rickson
  Date: 31/10/2024
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Atualizar Livro</title>
</head>
<body>

<div>
  <h2>Atualizar Livro</h2>

  <%
    String tituloAntigo = request.getParameter("tituloAntigo");
    String tituloNovo = request.getParameter("tituloNovo");
    String autor = request.getParameter("autor");
    String edicao = request.getParameter("edicao");
    String editora = request.getParameter("editora");
    String ano = request.getParameter("ano");
    String codigo = request.getParameter("codigo");
    String exemplares = request.getParameter("exemplares");

    if (tituloAntigo == null) {
  %>

  <form action="atualizar.jsp" method="POST">
    <div>
      <label for="tituloAntigo">Título Antigo</label>
      <input type="text" id="tituloAntigo" name="tituloAntigo" placeholder="Título antigo do livro" required>
    </div>
    <div>
      <label for="tituloNovo">Título Novo</label>
      <input type="text" id="tituloNovo" name="tituloNovo" placeholder="Novo título do livro" required>
    </div>
    <div>
      <label for="autor">Autor</label>
      <input type="text" id="autor" name="autor" placeholder="Nome do autor" required>
    </div>
    <div>
      <label for="edicao">Edição</label>
      <input type="text" id="edicao" name="edicao" placeholder="Número da edição" required>
    </div>
    <div>
      <label for="editora">Editora</label>
      <input type="text" id="editora" name="editora" placeholder="Nome da editora" required>
    </div>
    <div>
      <label for="ano">Ano</label>
      <input type="text" id="ano" name="ano" placeholder="Ano de publicação" required>
    </div>
    <div>
      <label for="codigo">Código</label>
      <input type="text" id="codigo" name="codigo" placeholder="Código do livro" required>
    </div>
    <div>
      <label for="exemplares">Exemplares</label>
      <input type="text" id="exemplares" name="exemplares" placeholder="Quantidade de exemplares" required>
    </div>
    <button type="submit">Atualizar</button>
  </form>

  <%
  } else {
    try {


      int edition = Integer.parseInt(edicao);
      int year = Integer.parseInt(ano);
      int copies = Integer.parseInt(exemplares);

      DataBase dataBase = new DataBase();
      dataBase.updateBook(tituloAntigo, tituloNovo, autor, edicao, edition, year, codigo, copies);

      out.println("<div>Livro atualizado!</div>");
    } catch (NumberFormatException e) {
      out.println("<div>Erro ao atualizar livro.</div>");
    }

  %>

  <div>

  </div>

  <%
    }
  %>
</div>

</body>
</html>
