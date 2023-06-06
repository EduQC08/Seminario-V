<?php

require_once '../model/Alquiler.php';


function renderJSON($object = []){
  if($object){
      echo json_encode($object);
  }
}






if(isset($_POST['operacion'])){

  $alquiler = new Alquiler();

  

  if($_POST['operacion'] == 'listar'){

    $datos = $alquiler->listarAlquiler();

    if($datos){
      echo json_encode($datos);
    }
  }

  if ($_POST['operacion'] == 'buscar'){
    $datos = $alquiler->buscarHabitacion($_POST['idhabitacion']);
    echo json_encode($datos);
  }



  if($_POST['operacion'] == 'registrar'){
    $datosGuardar = [
      "idhabitacion"              => $_POST['idhabitacion'],
      "idcliente"                 => $_POST['idcliente'],
      "idusuario"                 => $_POST['idusuario'],
      "pago"                      => $_POST['pago']

      
    ];
    $respuesta = $alquiler->RegistrarAlquiler($datosGuardar);
    echo json_encode($respuesta); 
  }

  if($_POST['operacion'] == 'horasalida'){
  
    $datos = [
      "idalquiler" => $_POST['idalquiler'],
      "idhabitacion" => $_POST['idhabitacion']
    ];
  
    $respuesta = $alquiler->actualizar($datos);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'resumeAlquiler'){
    $datos = $alquiler->getAlquilerResume();
    renderJSON($datos);
  }

  
  if($_POST['operacion'] == 'listara'){

    $datos = $alquiler->listarAlquileres();

    if($datos){
      echo json_encode($datos);
    }
  }
  

  
  
}