<?php
class ControladorUsuarios{
    // INGRESO DE USUARIOS

    public function  ctrIngresoUsuario(){
        if(isset($_POST["ingUsuario"])){                        
            $tabla = "usuario";
            $campo = "username"; //Se busca el campo por el username
            $valor = $_POST["ingUsuario"];

            // Buscamos al campo.
            $respuesta= ModeloUsuarios::MdlMostrarUsuarios($tabla,$campo,$valor) ;
            
            if($respuesta["username"]==$_POST["ingUsuario"]&& 
               $respuesta["password"]==$_POST["ingPassword"] &&
               $respuesta["estado_trabajador"]==1
               ){
                
                //echo "<p>Si funciona </p>" ;                
                $_SESSION ["iniciarSesion"] ="ok";
                $_SESSION ["administrador"] = $respuesta["administrador"];

                // echo $_SESSION ["iniciarSesion"];
                // echo $_SESSION ["administrador"];
                
                echo '<script> window.location ="inicio"</script>';
               }else{
                    echo '<br><div class="alert alert-danger">Error al ingresar, vuelve a intentarlo</div>';
               }                      

        }
    }
}