<%-- 
    Document   : verReceita
    Created on : 2 de ago. de 2024, 15:55:17
    Author     : Aluno
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RECEITAS</title>
    </head>
    <body>
        <h1>Visualizar receita</h1>
        <%
        String idS = request.getParameter("id");
        if (!idS.isEmpty()) {
            int id = Integer.parseInt(idS);
            List<Receita> receitas = Receita.getReceita(id);
            for (Receita receita : receitas) {
            %>  
            <div>Receita: <%= receita.getNome() %></div>
            <div><%= receita.getDescricao() %></div>
            <div>Porções: <%= receita.getPorcoes() %> 
                - Tempo: <%= receita.getTempoPreparo() %> minutos </div>
            <div>Ingredientes: <%= receita.getIngredientes() %></div>
            <div>Modo de fazer: <br>
                <%= receita.getPreparo() %></div>
            <%
                }  
        } else {
            out.print("Receita não encontrada");
            }
        %>
    </body>
</html>
