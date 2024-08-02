<%-- 
    Document   : editarReceita
    Created on : 2 de ago. de 2024, 16:35:51
    Author     : Aluno
--%>

<%@page import="java.util.List"%>
<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Receita</title>
</head>
<body>
    <h2>Cadastrar Receita</h2>
    
    <%
        String idS = request.getParameter("id");
        if (!idS.isEmpty()) {
            int id = Integer.parseInt(idS);
            List<Receita> receitas = Receita.getReceita(id);
            for (Receita receita : receitas) {
            %> 
    <form action="atualizaReceitas.jsp" method="post">
        <input type="hidden" id="id" name="id" value="<%= receita.getId() %>">
        Nome da Receita: <input type="text" name="nome" required value="<%= receita.getNome() %>"><br>
        Descrição: <textarea name="descricao" required><%= receita.getDescricao() %></textarea><br>
        Tempo de Preparo (minutos): <input type="number" name="tempoPreparo" required value="<%= receita.getPorcoes() %>"><br>
        Porções: <input type="number" name="porcoes" required value="<%= receita.getTempoPreparo() %>"><br>
        Ingredientes: <textarea name="ingredientes" required ><%= receita.getIngredientes() %></textarea><br>
        Preparo: <textarea name="preparo" required><%= receita.getPreparo() %></textarea><br>
        <input type="submit" value="Salvar Receita">
    </form>
                <%
                }  
        } else {
            out.print("Receita não encontrada");
            }
        %>
</body>
</html>
