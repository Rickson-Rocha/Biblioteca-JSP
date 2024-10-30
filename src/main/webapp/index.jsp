<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<h1>Teste

    <%

        String nome = "Diego";
        for(int i=1; i<=10; i++){
            out.print("<br>" + nome);
        }

        int idade = 19;

        if(idade >= 18){
            out.print("Essa pessa é de maior");
        }else{
            out.print("Essa pessa é de menor");
        }


    %>
    <br>
    <br>
    <br>
    <form action="menu.jsp" method="POST" border="1">

        LOGIN <input type="text" name="login"><br>
        SENHA <input type="text" name="senha">
        <input type="submit" value="ENVIAR">

    </form>

</h1>
</body>
</html>