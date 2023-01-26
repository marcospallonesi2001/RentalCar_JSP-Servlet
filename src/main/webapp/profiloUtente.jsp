<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: marco
  Date: 25/01/2023
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profilo utente</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
  <script src="https://kit.fontawesome.com/1c742923ac.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- HEADER -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Rental Car</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <c:choose>
          <c:when test="${isAdmin==1}">
            <a class="nav-link" href="utenteServlet?id=${id}&action=home">Home</a>
          </c:when>
          <c:otherwise>
            <a class="nav-link" href="prenotazioneServlet?id=${id}">Home</a>
          </c:otherwise>
        </c:choose>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="autoServlet?isAdmin=${isAdmin}&id=${id}&action=home">Parco Auto</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Profilo utente</a>
      </li>
    </ul>
  </div>
  <div class="nav navbar-nav navbar-right">
    <a href="loginPage.jsp" class="navbar-brand"><button type="button" class="btn btn-danger"><i class="bi bi-box-arrow-right"></i> Esci</button></a>
  </div>
</nav>

<!--FORM DI MODIFICA-->
<div class="container">
  <div class="row">
    <div class="mx-auto mt-5 col-sm-6">
      <h2>Modifica dati</h2>
      <form action="utenteServlet" method="post">
        <input type="hidden" name="action" value="formutente">
        <input type="hidden" name="id" value="${id}">
        <input type="hidden" name="isAdmin" value="${isAdmin}">
        <input type="hidden" name="richiestada" value="profilo">
        <div class="mb-3">
          <label for="nome" class="form-label">Nome: </label>
          <input type="text" class="form-control" id="nome" name="nome" value="${utente.nome}">
        </div>
        <div class="mb-3">
          <label for="cognome" class="form-label">Cognome: </label>
          <input type="text" class="form-control" id="cognome" name="cognome" value="${utente.cognome}">
        </div>
        <div class="mb-3">
          <label for="user" class="form-label">Username: </label>
          <input type="text" class="form-control" id="user" name="user" value="${utente.username}">
        </div>
        <div class="mb-3">
          <label for="pass" class="form-label">Password: </label>
          <input type="password" class="form-control" id="pass" name="pass" value="${utente.password}">
        </div>
        <button type="submit" class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check" viewBox="0 0 16 16">
          <path d="M10.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.267.267 0 0 1 .02-.022z"/>
        </svg>Conferma</button>
      </form>
    </div>
  </div>
</div>

</body>
</html>
