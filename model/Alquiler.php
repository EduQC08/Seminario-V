<?php

require_once 'conexion.php';

class Alquiler  extends Conexion{
  private $conexion;

  public function __CONSTRUCT(){
    $this->conexion = parent::getConexion();
  }

  public function listarAlquiler(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_alquiler_listar()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
    die($e->getMessage());
    }
  }
  public function buscarHabitacion($idhabitacion){
    try{
      $consulta = $this->conexion->prepare("CALL spu_alquiler_buscar(?)");
      $consulta->execute(array($idhabitacion));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function actualizar ($datos = []){
    $respuesta = [
      "status " => false,
      "message" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL horasalida(?,?)");
      $respuesta["status"] = $consulta->execute(
array(
          $datos["idalquiler"],
          $datos["idhabitacion"]
        )
        );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo error";
    }
    return $respuesta;
  }

  public function RegistrarAlquiler($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->conexion->prepare("CALL spu_alquiler_registrar (?,?,?,?)");
       $respuesta["status"] = $consulta->execute(array(
          $datos["idhabitacion"],
          $datos["idcliente"],
          $datos["idusuario"],
          $datos["pago"]
        ));
      }
      catch(Exception $e){
        $respuesta["message"] = "no se ha podido completar la operacion Codigo error:".$e->getCode();
      }
    return $respuesta;
  }

  public function getAlquilerResume(){
    try{
      $consulta = $this->conexion->prepare("CALL spu_alquileres_resume()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
          die($e->getMessage());
        }
  }

  public function listarAlquileres(){
    try{
      $consulta = $this->conexion->prepare("CALL listar_historial()");
      $consulta->execute();
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
    die($e->getMessage());
    }
  }

  

  
}