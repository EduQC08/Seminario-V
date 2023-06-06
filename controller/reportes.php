<?php

require_once '../model/Alquiler.php';

    function renderJSON($object = []){
        if($object){
            echo json_encode($object);
        }
    }

if (isset($_POST['operacion'])){

    switch($_POST['operacion']){
        case 'listarAlquiler':
            $alquiler = new Alquiler();
            renderJSON($alquiler->listarAlquiler());
            break;

    }
}