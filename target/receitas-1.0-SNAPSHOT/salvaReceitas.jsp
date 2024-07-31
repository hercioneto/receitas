<%-- 
    Document   : salvaReceitas
    Created on : 31 de jul. de 2024, 14:50:31
    Author     : Aluno
--%>

<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String descricao = request.getParameter("descricao");
    int tempoPreparo = Integer.parseInt(request.getParameter("tempoPreparo"));
    int porcoes = Integer.parseInt(request.getParameter("porcoes"));
    String ingredientes = request.getParameter("ingredientes");
    String preparo = request.getParameter("preparo");

    Receita receita = new Receita();
    receita.setNome(nome);
    receita.setDescricao(descricao);
    receita.setTempoPreparo(tempoPreparo);
    receita.setPorcoes(porcoes);
    receita.setIngredientes(ingredientes);
    receita.setPreparo(preparo);

    boolean sucesso = receita.salvar();

    if (sucesso) {
        out.println("Receita salva com sucesso!");
    } else {
        out.println("Erro ao salvar receita.");
    }
%>

<p><a href="cadastraReceita.jsp">Voltar</a></p>
