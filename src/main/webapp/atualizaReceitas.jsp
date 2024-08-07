<%-- 
    Document   : atualizaReceitas
    Created on : 7 de ago. de 2024, 14:50:25
    Author     : Aluno
--%>

<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizar Receita</title>
    </head>
    <body>
        <h1>Atualizando receita!</h1>
        <%
    int id = Integer.parseInt(request.getParameter("id"));
    String nome = request.getParameter("nome");
    String descricao = request.getParameter("descricao");
    int tempoPreparo = Integer.parseInt(request.getParameter("tempoPreparo"));
    int porcoes = Integer.parseInt(request.getParameter("porcoes"));
    String ingredientes = request.getParameter("ingredientes");
    String preparo = request.getParameter("preparo");

    Receita receita = new Receita();
    receita.setId(id);
    receita.setNome(nome);
    receita.setDescricao(descricao);
    receita.setTempoPreparo(tempoPreparo);
    receita.setPorcoes(porcoes);
    receita.setIngredientes(ingredientes);
    receita.setPreparo(preparo);

    boolean sucesso = receita.atualizar();

    if (sucesso) {
        out.println("Receita atualizada com sucesso!");
    } else {
        out.println("Erro ao atualizar receita.");
    }
%>
<p><a href="listaReceitas.jsp">Voltar para lista de receitas.</a></p>
    </body>
</html>
