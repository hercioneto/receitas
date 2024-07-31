<%-- 
    Document   : listaReceitas
    Created on : 31 de jul. de 2024, 15:17:19
    Author     : Aluno
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Receitas</title>
</head>
<body>
    <h2>Lista de Receitas</h2>
    <table border="1">
        <tr>
            <th>Nome</th>
            <th>Descrição</th>
            <th>Tempo de Preparo</th>
            <th>Porções</th>
            <th>Ingredientes</th>
            <th>Preparo</th>
        </tr>
        <%
            List<Receita> receitas = Receita.getAllReceitas();
            for (Receita receita : receitas) {
        %>
        <tr>
            <td><%= receita.getNome() %></td>
            <td><%= receita.getDescricao() %></td>
            <td><%= receita.getTempoPreparo() %> minutos</td>
            <td><%= receita.getPorcoes() %></td>
            <td><%= receita.getIngredientes() %></td>
            <td><%= receita.getPreparo() %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
