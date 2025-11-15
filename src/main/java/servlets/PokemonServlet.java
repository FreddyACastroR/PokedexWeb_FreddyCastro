/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import models.Pokemon;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Freddy Alí Castro Román 252191
 */
@WebServlet(name = "PokemonServlet", urlPatterns = {"/PokemonServlet"})
public class PokemonServlet extends HttpServlet {

    private static final String ATTR_LISTA_POKEMON = "listaPokemon";

    @Override
    public void init() throws ServletException {

        super.init();

        // Inicializar la lista de pokemones
        List<Pokemon> listaPokemon = new ArrayList<>();

        // Agregar pokemones ejemplo
        listaPokemon.add(new Pokemon(25, "Pikachu", "Eléctrico",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"));
        listaPokemon.add(new Pokemon(1, "Bulbasaur", "Planta/Veneno",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"));
        listaPokemon.add(new Pokemon(6, "Charizard", "Fuego/Volador",
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png"));

        getServletContext().setAttribute(ATTR_LISTA_POKEMON, listaPokemon);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener la lista de pokemones
        List<Pokemon> listaPokemon = (List<Pokemon>) getServletContext().getAttribute(ATTR_LISTA_POKEMON);

        // Pasar la lista a la vista
        request.setAttribute(ATTR_LISTA_POKEMON, listaPokemon);

        // Redirigir a la página de la pokedex
        request.getRequestDispatcher("/pokedex.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obtener los parámetros del formulario
        String numeroStr = request.getParameter("numero");
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        String urlImagen = request.getParameter("urlImagen");

        // Validar que los campos no estén vacíos
        if (numeroStr != null && !numeroStr.trim().isEmpty()
                && nombre != null && !nombre.trim().isEmpty()
                && tipo != null && !tipo.trim().isEmpty()
                && urlImagen != null && !urlImagen.trim().isEmpty()) {

            try {
                int numero = Integer.parseInt(numeroStr);

                // Crear el nuevo Pokemon
                Pokemon nuevoPokemon = new Pokemon(numero, nombre, tipo, urlImagen);

                List<Pokemon> listaPokemon = (List<Pokemon>) getServletContext().getAttribute(ATTR_LISTA_POKEMON);

                if (listaPokemon == null) {
                    listaPokemon = new ArrayList<>();
                    getServletContext().setAttribute(ATTR_LISTA_POKEMON, listaPokemon);
                }

                listaPokemon.add(nuevoPokemon);

            } catch (NumberFormatException e) {

            }
        }

        response.sendRedirect(request.getContextPath() + "/PokemonServlet");
    }
}
