<%@ page import="java.sql.DatabaseMetaData" %>
<%@ page import="java.awt.image.BandCombineOp" %><%--
  Created by IntelliJ IDEA.
  User: rickson
  Date: 17/10/2024
  Time: 09:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="resources.data.Banco" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    if (login != null && senha != null) {
        Banco b = new Banco();
        String nomeCompleto = b.getUsuario(login);



%>
<center>
    <h1>MENU PRINCIPAL</h1>
    <h2>Bem-vindo, <%= nomeCompleto %>!</h2>
    <ul>
        <li><a href="adicionarLivro.jsp">Adicionar Livro</a></li>
        <li><a href="consultarLivro.jsp">Consultar Livro</a></li>
        <li><a href="excluirLivro.jsp">Excluir Livro</a></li>
        <li><a href="logout.jsp">Sair</a></li>
    </ul>
</center>
<%
} else {
%>
<center>
    USUÁRIO OU SENHA INCORRETOS <br>
    <a href='index.jsp'>Clique aqui para voltar</a>
</center>
<%
    }
} else {
%>
<center>
    Parâmetros de login e senha ausentes. <br>
    <a href='index.jsp'>Clique aqui para voltar</a>
</center>
<%
    }
%>

</body>

</html>