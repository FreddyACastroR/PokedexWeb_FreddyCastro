/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.io.Serializable;

/**
 * @author Freddy Alí Castro Román 252191
 */

public class Pokemon implements Serializable {

    private static final long serialVersionUID = 1L;

    private int numero;
    private String nombre;
    private String tipo;
    private String urlImagen;

    public Pokemon() {
    }

    public Pokemon(int numero, String nombre, String tipo, String urlImagen) {
        this.numero = numero;
        this.nombre = nombre;
        this.tipo = tipo;
        this.urlImagen = urlImagen;
    }

    // Getters y Setters
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    @Override
    public String toString() {
        return "Pokemon{"
                + "numero=" + numero
                + ", nombre='" + nombre + '\''
                + ", tipo='" + tipo + '\''
                + ", urlImagen='" + urlImagen + '\''
                + '}';
    }
}
