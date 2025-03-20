package com.kmsl.model;

public class Usuario {
    private String nome;
    private String email;
    private String cidade;
    private String estado;

    // Construtor
    public Usuario(String nome, String email, String cidade, String estado) {
        this.nome = nome;
        this.email = email;
        this.cidade = cidade;
        this.estado = estado;
    }

    // Getters e Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}

