/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.receitas;

/**
 *
 * @author Aluno
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Receita {
    private String nome;
    private String descricao;
    private int tempoPreparo;
    private int porcoes;
    private String ingredientes;
    private String preparo;

    // Getters e Setters
    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public int getTempoPreparo() { return tempoPreparo; }
    public void setTempoPreparo(int tempoPreparo) { this.tempoPreparo = tempoPreparo; }

    public int getPorcoes() { return porcoes; }
    public void setPorcoes(int porcoes) { this.porcoes = porcoes; }

    public String getIngredientes() { return ingredientes; }
    public void setIngredientes(String ingredientes) { this.ingredientes = ingredientes; }

    public String getPreparo() { return preparo; }
    public void setPreparo(String preparo) { this.preparo = preparo; }

    // Método para salvar a receita no banco de dados
    public boolean salvar() {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO receitas (nome, descricao, tempo_preparo, porcoes, ingredientes, preparo) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, getNome());
            ps.setString(2, getDescricao());
            ps.setInt(3, getTempoPreparo());
            ps.setInt(4, getPorcoes());
            ps.setString(5, getIngredientes());
            ps.setString(6, getPreparo());

            int rowsInserted = ps.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    
    // Método para retornar todas as receitas do banco de dados
    public static List<Receita> getAllReceitas() {
        List<Receita> receitas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM receitas";

        try {
            conn = dbUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Receita receita = new Receita();
                receita.setNome(rs.getString("nome"));
                receita.setDescricao(rs.getString("descricao"));
                receita.setTempoPreparo(rs.getInt("tempo_preparo"));
                receita.setPorcoes(rs.getInt("porcoes"));
                receita.setIngredientes(rs.getString("ingredientes"));
                receita.setPreparo(rs.getString("preparo"));
                receitas.add(receita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return receitas;
    }
}

/*
CREATE TABLE receitas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    tempo_preparo INT NOT NULL,
    porcoes INT NOT NULL,
    ingredientes TEXT NOT NULL,
    preparo TEXT NOT NULL
);
*/