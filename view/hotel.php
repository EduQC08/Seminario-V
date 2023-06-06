<?php
session_start();

//Si el usario ya tiene una sesión activa ... entonces no debe estar aqui!!!

if(!isset($_SESSION['seguridad']) || $_SESSION['seguridad']['login'] == false){

  header('Location: ../index.html');
}
?>

<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


</head>

<body>

  <!-- Modal trigger button -->
  
  
  <!-- Optional: Place to the bottom of scripts -->

    <div class="container mb-5" id="container">
      <!-- <div class="row"> -->
      <nav class="navbar navbar-dark bg-dark fixed-top ">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">INICIO</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
            aria-controls="offcanvasNavbar">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
            aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
              <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
              <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">

                <li class="nav-item">
                    <a class="nav-link text-dark" href="./alquiler.html">- Alquiler</a>
                  </li>
                <li class="nav-item">
                  <a class="nav-link text-dark" href="./clientes.html">- Clientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link text-dark" href="./historial.html">- Historial de Alquiler</a>
                </li>
                <li class="nav-item">
                <a class="nav-link text-danger" href="../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
              </li>
               
              </ul>

            </div>
          </div>
        </div>
      </nav>


      </div>
      
      <div class="container mt-3">
    <div class="row">

      <div class="col-md-7 ">
        <canvas id="grafico"></canvas>

      </div>
      <div class="col-md-5 mt-5">
 
       <ul id="lista-leyenda">

       </ul>   

       <button class="btn btn-sm btn-success" id="actualizar">Actualizar</button>
        </div>


      </div>
    </div>
  


      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", () =>{


      const btActualizar = document.querySelector("#actualizar");
      const lienzo = document.getElementById("grafico");
      const leyenda = document.querySelector("#lista-leyenda");

      const graficoBarras = new Chart(lienzo, {
        type: "bar",
        data: {
          labels: [ ],
          datasets:[
            {
              label: '',
              data:[],
              
            }
          ]
        }
      });

      function renderGraphic(coleccion = []){
        let etiquetas = [];
        let datos = [];
        leyenda.innerHTML = ``;

        coleccion.forEach(element =>{
          etiquetas.push(element.idhabitacion);
                    datos.push(element.Alquilados);

                    const  tagLI = document.createElement('li');
                    tagLI.innerHTML = `${element.idhabitacion}: <strong>${element.Alquilados}</strong`;
                    leyenda.appendChild(tagLI);
        });
        graficoBarras.data.labels = etiquetas;
        graficoBarras.data.datasets[0].data = datos;
        graficoBarras.update();
      }

      function loadData(){
        const parametros = new URLSearchParams();
        parametros.append('operacion', 'resumeAlquiler');

        fetch(`../controller/Alquiler.php`,{
          method: 'POST',
          body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
          renderGraphic(datos);
        });
      }
      btActualizar.addEventListener('click',loadData);


    });
  </script>
</body>
</html>