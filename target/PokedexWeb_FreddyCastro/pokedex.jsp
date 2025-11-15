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
        <title>Pokédex - Lista de Pokemon</title>
        <link rel="stylesheet" href="css/styles.css">
        <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="pokedex-page">
        <div class="pokeball-bg"></div>

        <div class="container">
            <header class="header">
                <div class="logo">
                    <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png" alt="Pokeball">
                    <h1 class="title-retro">Pokédex</h1>
                </div>
                <p class="subtitle">Registro Completo de Pokemon</p>
            </header>

            <!-- Mensajes de notificación -->
            <c:if test="${not empty mensaje}">
                <div class="notification ${tipoMensaje}">
                    <c:choose>
                        <c:when test="${tipoMensaje == 'success'}">
                            <span class="notification-icon">✅</span>
                        </c:when>
                        <c:otherwise>
                            <span class="notification-icon">❌</span>
                        </c:otherwise>
                    </c:choose>
                    ${mensaje}
                </div>
            </c:if>

            <div class="pokedex-stats">
                <div class="stat-card">
                    <span class="stat-icon">📊</span>
                    <div class="stat-info">
                        <h3>${fn:length(listaPokemon)}</h3>
                        <p>Pokemon Registrados</p>
                    </div>
                </div>
                <div class="stat-card">
                    <span class="stat-icon">🎮</span>
                    <div class="stat-info">
                        <h3>Gen I-IX</h3>
                        <p>Generaciones</p>
                    </div>
                </div>
                <div class="stat-card">
                    <span class="stat-icon">⭐</span>
                    <div class="stat-info">
                        <h3>18</h3>
                        <p>Tipos Disponibles</p>
                    </div>
                </div>
            </div>

            <div class="actions-bar">
                <a href="index.jsp" class="btn btn-primary">
                    <span class="btn-icon">➕</span>
                    Agregar Nuevo Pokemon
                </a>
                <div class="search-box">
                    <input type="text" id="searchInput" placeholder="Buscar Pokemon..." onkeyup="filtrarPokemon()">
                    <span class="search-icon">🔍</span>
                </div>
            </div>

            <c:choose>
                <c:when test="${empty listaPokemon}">
                    <div class="empty-state">
                        <img src="https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png" alt="Psyduck">
                        <h2>¡No hay Pokemon registrados!</h2>
                        <p>Comienza a construir tu Pokédex agregando tu primer Pokemon</p>
                        <a href="index.jsp" class="btn btn-primary">
                            <span class="btn-icon">➕</span>
                            Agregar Pokemon
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="pokemon-grid" id="pokemonGrid">
                        <c:forEach var="pokemon" items="${listaPokemon}">
                            <div class="pokemon-card" data-nombre="${fn:toLowerCase(pokemon.nombre)}" data-numero="${pokemon.numero}" data-tipo="${fn:toLowerCase(pokemon.tipo)}">
                                <div class="pokemon-card-header">
                                    <span class="pokemon-numero">#${String.format("%03d", pokemon.numero)}</span>
                                    <span class="pokemon-tipo tipo-${fn:replace(fn:toLowerCase(fn:split(pokemon.tipo, '/')[0]), 'é', 'e')}">${pokemon.tipo}</span>
                                </div>

                                <div class="pokemon-image-container">
                                    <img src="${pokemon.urlImagen}" 
                                         alt="${pokemon.nombre}" 
                                         class="pokemon-image"
                                         onerror="this.src='https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png'">
                                </div>

                                <div class="pokemon-card-body">
                                    <h3 class="pokemon-nombre">${pokemon.nombre}</h3>
                                    <div class="pokemon-details">
                                        <div class="detail-item">
                                            <span class="detail-label">Número:</span>
                                            <span class="detail-value">${pokemon.numero}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <!-- Vista de tabla alternativa (responsive) -->
                    <div class="table-container">
                        <table class="pokemon-table">
                            <thead>
                                <tr>
                                    <th>Imagen</th>
                                    <th>Número</th>
                                    <th>Nombre</th>
                                    <th>Tipo(s)</th>
                                </tr>
                            </thead>
                            <tbody id="pokemonTableBody">
                                <c:forEach var="pokemon" items="${listaPokemon}">
                                    <tr class="pokemon-row" data-nombre="${fn:toLowerCase(pokemon.nombre)}" data-numero="${pokemon.numero}" data-tipo="${fn:toLowerCase(pokemon.tipo)}">
                                        <td class="td-image">
                                            <img src="${pokemon.urlImagen}" 
                                                 alt="${pokemon.nombre}" 
                                                 class="table-pokemon-image"
                                                 onerror="this.src='https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png'">
                                        </td>
                                        <td class="td-numero">
                                            <span class="badge">#${String.format("%03d", pokemon.numero)}</span>
                                        </td>
                                        <td class="td-nombre">
                                            <strong>${pokemon.nombre}</strong>
                                        </td>
                                        <td class="td-tipo">
                                            <span class="pokemon-tipo tipo-${fn:replace(fn:toLowerCase(fn:split(pokemon.tipo, '/')[0]), 'é', 'e')}">
                                                ${pokemon.tipo}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>

            <footer class="footer">
                <p>Desarrollado por <strong>Freddy Castro</strong> - ITSON</p>
                <p class="footer-year">Aplicaciones Web 2025</p>
            </footer>
        </div>

        <script>
            // Función de búsqueda
            function filtrarPokemon() {
                const input = document.getElementById('searchInput');
                const filter = input.value.toLowerCase();
                const cards = document.querySelectorAll('.pokemon-card');
                const rows = document.querySelectorAll('.pokemon-row');

                // Filtrar cards
                cards.forEach(card => {
                    const nombre = card.getAttribute('data-nombre');
                    const numero = card.getAttribute('data-numero');
                    const tipo = card.getAttribute('data-tipo');

                    if (nombre.includes(filter) || numero.includes(filter) || tipo.includes(filter)) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });

                rows.forEach(row => {
                    const nombre = row.getAttribute('data-nombre');
                    const numero = row.getAttribute('data-numero');
                    const tipo = row.getAttribute('data-tipo');

                    if (nombre.includes(filter) || numero.includes(filter) || tipo.includes(filter)) {
                        row.style.display = 'table-row';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }

            document.addEventListener('DOMContentLoaded', function () {
                const cards = document.querySelectorAll('.pokemon-card');
                cards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.animation = 'fadeInUp 0.5s ease forwards';
                    }, index * 50);
                });
            });
        </script>
    </body>
</html>