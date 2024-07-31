<%-- 
    Document   : cadastraReceita
    Created on : 31 de jul. de 2024, 14:50:09
    Author     : Aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Cadastrar Receita</title>
</head>
<body>
    <h2>Cadastrar Receita</h2>
    <form action="salvaReceitas.jsp" method="post">
        Nome da Receita: <input type="text" name="nome" required><br>
        Descrição: <textarea name="descricao" required></textarea><br>
        Tempo de Preparo (minutos): <input type="number" name="tempoPreparo" required><br>
        Porções: <input type="number" name="porcoes" required><br>
        Ingredientes: <textarea name="ingredientes" required></textarea><br>
        Preparo: <textarea name="preparo" required></textarea><br>
        <input type="submit" value="Salvar Receita">
    </form>
</body>
</html>

