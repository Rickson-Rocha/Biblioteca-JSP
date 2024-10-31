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
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Menu Principal - Biblioteca</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            text-align: center;
        }
        .menu-list {
            list-style: none;
            padding: 0;
        }
        .menu-list li {
            margin: 15px 0;
        }
        .menu-list a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
        }
        .menu-list a:hover {
            text-decoration: underline;
        }
        h1, h2 {
            color: #343a40;
        }
    </style>
</head>
<body>
<%
    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    if (login != null && senha != null) {
        Banco b = new Banco();
        String nomeCompleto = b.getUsuario(login);
%>
<div class="container">
    <h1>MENU PRINCIPAL</h1>
    <h2>Bem-vindo, <%= nomeCompleto %>!</h2>
    <ul class="menu-list">
        <li><a href="adicionarLivro.jsp">Adicionar Livro</a></li>
        <li><a href="consultarLivro.jsp">Consultar Livro</a></li>
        <li><a href="excluirLivro.jsp">Excluir Livro</a></li>
        <li><a href="logout.jsp">Sair</a></li>
    </ul>
</div>
<%
} else {
%>
<div class="container">
    <h2>USUÁRIO OU SENHA INCORRETOS</h2>
    <a href='index.jsp'>Clique aqui para voltar</a>
</div>
<%
    }
%>
</body>
</html>
