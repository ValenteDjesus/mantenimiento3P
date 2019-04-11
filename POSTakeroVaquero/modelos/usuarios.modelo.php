<?php
require_once "conexion.php";
class ModeloUsuarios{
    
    static public function MdlMostrarUsuarios($tabla,$campo,$valor){

        $stmt = Conexion::conectar()->prepare("SELECT * FROM $tabla where $campo = :$campo");

        $stmt -> bindParam(":".$campo, $valor, PDO::PARAM_STR);
        
        $stmt -> execute();

        return $stmt -> fetch();

    }   

}