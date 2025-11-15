<%-- 
    @author Freddy Alí Castro Román 252191
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pokédex - Agregar Pokemon</title>
        <link rel="stylesheet" href="css/styles.css">
        <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="pokeball-bg"></div>

        <div class="container">
            <header class="header">
                <div class="logo">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png" alt="Pokeball">
                    <h1 class="title-retro">Pokédex</h1>
                </div>
                <p class="subtitle">Sistema de Registro de Pokemon</p>
            </header>

            <div class="form-container">
                <div class="form-header">
                    <h2>Registrar Nuevo Pokemon</h2>
                    <p>Completa los datos del Pokemon para agregarlo a la Pokédex</p>
                </div>

                <form action="PokemonServlet" method="post" class="pokemon-form">
                    <div class="form-group">
                        <label for="numero">
                            <span class="label-icon">🔢</span>
                            Número de Pokédex
                        </label>
                        <input type="number" 
                               id="numero" 
                               name="numero" 
                               placeholder="Ej: 25" 
                               required 
                               min="1" 
                               max="1025">
                        <small>Número único del Pokemon en la Pokédex Nacional</small>
                    </div>

                    <div class="form-group">
                        <label for="nombre">
                            <span class="label-icon">⭐</span>
                            Nombre del Pokemon
                        </label>
                        <input type="text" 
                               id="nombre" 
                               name="nombre" 
                               placeholder="Ej: Pikachu" 
                               required 
                               maxlength="50">
                        <small>Nombre oficial del Pokemon</small>
                    </div>

                    <div class="form-group">
                        <label for="tipo">
                            <span class="label-icon">⚡</span>
                            Tipo(s)
                        </label>
                        <select id="tipo" name="tipo" required>
                            <option value="">Selecciona un tipo...</option>
                            <option value="Normal">Normal</option>
                            <option value="Fuego">Fuego 🔥</option>
                            <option value="Agua">Agua 💧</option>
                            <option value="Planta">Planta 🌿</option>
                            <option value="Eléctrico">Eléctrico ⚡</option>
                            <option value="Hielo">Hielo ❄️</option>
                            <option value="Lucha">Lucha 🥊</option>
                            <option value="Veneno">Veneno ☠️</option>
                            <option value="Tierra">Tierra 🌍</option>
                            <option value="Volador">Volador 🦅</option>
                            <option value="Psíquico">Psíquico 🔮</option>
                            <option value="Bicho">Bicho 🐛</option>
                            <option value="Roca">Roca 🪨</option>
                            <option value="Fantasma">Fantasma 👻</option>
                            <option value="Dragón">Dragón 🐉</option>
                            <option value="Siniestro">Siniestro 🌙</option>
                            <option value="Acero">Acero ⚙️</option>
                            <option value="Hada">Hada ✨</option>
                            <option value="Fuego/Volador">Fuego/Volador</option>
                            <option value="Planta/Veneno">Planta/Veneno</option>
                            <option value="Agua/Volador">Agua/Volador</option>
                            <option value="Eléctrico/Acero">Eléctrico/Acero</option>
                        </select>
                        <small>Tipo elemental del Pokemon (puede ser doble tipo)</small>
                    </div>

                    <div class="form-group">
                        <label for="urlImagen">
                            <span class="label-icon">🖼️</span>
                            URL de la Imagen
                        </label>
                        <input type="url" 
                               id="urlImagen" 
                               name="urlImagen" 
                               placeholder="https://ejemplo.com/pokemon.png" 
                               required>
                        <small>URL de la imagen oficial del Pokemon</small>
                        <div class="url-helper">
                            <p>💡 <strong>Tip:</strong> Puedes usar imágenes de PokeAPI:</p>
                            <code>https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/[NUMERO].png</code>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <span class="btn-icon">➕</span>
                            Agregar Pokemon
                        </button>
                        <a href="PokemonServlet" class="btn btn-secondary">
                            <span class="btn-icon">📖</span>
                            Ver Pokédex
                        </a>
                    </div>
                </form>
            </div>

            <footer class="footer">
                <p>Desarrollado por <strong>Freddy Castro</strong> - ITSON</p>
                <p class="footer-year">Aplicaciones Web 2025</p>
            </footer>
        </div>
        <script>
            const form = document.querySelector('.pokemon-form');
            form.addEventListener('submit', function (e) {
                const btn = this.querySelector('.btn-primary');
                btn.innerHTML = '<span class="btn-icon">⏳</span> Agregando...';
                btn.disabled = true;
            });
        </script>
    </body>
</html>
