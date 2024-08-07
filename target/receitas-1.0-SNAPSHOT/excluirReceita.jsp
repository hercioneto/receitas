<%-- 
    Document   : excluirReceita
    Created on : 7 de ago. de 2024, 15:57:30
    Author     : Aluno
--%>


<%@page import="com.mycompany.receitas.Receita"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Receita</title>
    </head>
    <body>
        <h1>Excluindo receita!</h1>
        <%
    int id = Integer.parseInt(request.getParameter("id"));
    Receita receita = new Receita();
    receita.setId(id);
    
    boolean sucesso = receita.deletar();

    if (sucesso) {
        out.println("Receita excluida com sucesso!");
    } else {
        out.println("Erro ao excluir receita.");
    }
%>
<p><a href="listaReceitas.jsp">Voltar para lista de receitas.</a></p>
    </body>
</html>
