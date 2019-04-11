        Drop database if exists TyVBDD;
        create database TyVBDD;
        use TyVBDD;
        
        CREATE TABLE Trabajador(
            id_trabajador INT PRiMARY KEY Auto_Increment, 
            nombre VARCHAR(40),
            apellido_p VARCHAR(40),
            apellido_m VARCHAR(40),
            numero_direccion int (4),
            externo varchar(4),
            calle VARCHAR (255),
            colonia VARCHAR (40),
            localidad VARCHAR (40),
            municipio VARCHAR (40),
            estado VARCHAR (40),
            celular float (15),
            correo VARCHAR(40),    
            estado_trabajador boolean   
        );

        CREATE TABLE Usuario(
            id_usuario INT PRiMARY KEY Auto_Increment, 
            id_trabajador INT,
            username VARCHAR(40),         
            password VARCHAR(40),  
            administrador boolean,
            foreign KEY (id_trabajador) references trabajador(id_trabajador)
        );
                    
        CREATE TABLE venta(
            id_venta INT PRiMARY KEY Auto_Increment,
            fecha datetime,        
            mesa INT(3),         
            id_trabajador int,
            total_pago float (10,2),                
            foreign KEY (id_trabajador) references trabajador(id_trabajador)
        );
                
        CREATE TABLE categoria(
            id_categoria INT PRiMARY KEY Auto_Increment, 
            nombre_categoria VARCHAR(40),
            descripcion varchar(500)
        );

        CREATE TABLE producto(
            id_producto INT PRiMARY KEY Auto_Increment, 
            nombre_producto VARCHAR(40),
            precio float (8,2),
            descripcion text(500),
            id_categoria int,
            estado_producto boolean,
            almacen int(5),
            foreign KEY (id_categoria)references categoria(id_categoria)         
        );
            
        CREATE TABLE producto_venta(
            id_producto int, 
            id_venta int,
            cantidad int,
            foreign KEY (id_producto)references producto(id_producto),  
            foreign KEY (id_venta)references venta(id_venta)   
        );
        
        insert into trabajador values                             
        (null, "Martin","Gonzalez","Cuevas",
        15, "A", "16 de septiembre" , "Centro", "Santo Tomas", "Zempoala", "Hidalgo"
        ,7751355551,"martingc@hotmail.com",true),

        (null, "Efren","Ramos","Suarez",
        0, "S/N", "Zupliclan" , "Palmitas", "Zempoala", "Zempoala", "Hidalgo"
        ,7712743072,"ferer7u7@gmail.com",true),

        (null, "Valente de Jesus","López","Reyes",
        0, "S/N", "Calle" , "Matilde", "Pachuca", "Pachuca", "Hidalgo"
        ,7712599324,"valente@gmail.com",true),

        (null, "Sujeto Random","Apellido","Random",
        46, "901", "Calle Random 3" , "La calero", "Pachuca", "Pachuca", "Hidalgo"    
        ,101010101,"randommail@hotmail.com",false);

        insert into usuario values                             
        (null,1,"martingc", "123", true),
        (null,2,"ferer", "123", true),
        (null,3,"valente", "123", true),
        (null,4,"randoman", "123", false);     
          

    INSERT INTO `categoria` VALUES 
    (NULL, 'Tacos', 'Clásico tacos del Takero & Vakero'), 
    (NULL, 'Bebida', 'Bebidas para el consumo dentro del establecimiento'), 
    (NULL, 'Especiales', 'Platillos especiales del Takero y Vakero');
    
        insert into producto VALUES
        (null,"Taco de Arrachera",22,"Taco",1,1,null),
        (null,"Taco de Cesina",22,"Taco",1,1,null),
        (null,"Taco de Ch. Español",22,"Taco",1,1,null),
        (null,"Taco de Ch. Argentino",22,"Taco",1,1,null),
        (null,"Taco de Chistorra",22,"Taco",1,1,null), 
        (null,"Taco de Choriqueso",22,"Taco",1,1,null), 
        (null,"Taco de Rostbeff",22,"Taco",1,1,null),        
        (null,"Coca",15,"Bebida",2,1,20),
        (null,"Delaware",15,"Bebida",2,1,20),
        (null,"Sprite",15,"Bebida",2,1,20),
        (null,"Boing Mango",15,"Bebida",2,1,20),
        (null,"Boing Guaba",15,"Bebida",2,1,20),
        (null,"Fuse tea",15,"Bebida",2,1,20),
        (null,"Fanta fresa",15,"Bebida",2,1,20),
        (null,"Agua",15,"Bebida",2,1,20),    
        (null,"Quesadilla",18,"Especiales",3,1,null),
        (null,"Orden de quesadillas",40,"Especiales",3,1,null), 
        (null,"Orden Alas",60,"Especiales",3,1,null); 

    
    
        insert into venta VALUES
        (null, CURRENT_TIMESTAMP, 1, 1, 0),
        (null, CURRENT_TIMESTAMP, 2, 2, 0),
        (null, CURRENT_TIMESTAMP, 3, 3, 0),
        (null, CURRENT_TIMESTAMP, 4, 4, 0),
        (null, CURRENT_TIMESTAMP, 5, 4, 0);
                    
        --TRIGGER
        DELIMITER $
        create trigger upd_saldo_venta after insert on producto_venta
            FOR EACH ROW 
            BEGIN                 
                
                DECLARE valor FLOAT;
                DECLARE stock FLOAT;
                Declare stockminimo float;                 
                SELECT precio INTO valor FROM producto WHERE id_producto = NEW.id_producto;                 
                
                update venta Set total_pago = total_pago+(valor*NEW.cantidad) WHERE id_venta=NEW.id_venta;                
                update producto set almacen = almacen-NEW.cantidad WHERE id_producto = NEW.id_producto;                                           

                SELECT almacen INTO stock FROM producto WHERE id_producto = NEW.id_producto; 
                
                IF stock <= 0 THEN
                    update producto set estado_producto = false WHERE id_producto = NEW.id_producto; 
                    update producto set almacen = 0 WHERE id_producto = NEW.id_producto; 
                END IF;

                IF stock < NEW.cantidad THEN
                    update producto set estado_producto = false WHERE id_producto = NEW.id_producto; 
                    update producto set almacen = 0 WHERE id_producto = NEW.id_producto;                     
                END IF;                                    
            END $
        DELIMITER ;
        
        select * from venta;
        select * from producto;        
        
        CREATE VIEW producto_categoria as 
        SELECT p.id_producto,p.nombre_producto, p.descripcion, c.nombre_categoria, p.almacen,p.precio, p.estado_producto
                FROM producto as p INNER JOIN categoria as c
                ON c.id_categoria= p.id_categoria;          
        SELECT * FROM producto_categoria; 

        insert into producto_venta VALUES
        (1,1,1),
        (8,1,21),

        (2,2,3),
        (9,2,1),

        (18,3,1),
        (14,3,1),

        (17,4,3),
        (13,4,1),

        (5,5,5),
        (9,5,2);
        --UPDATE producto SET almacen =1 WHERE id_producto = 8;
        select * from venta;
        select * from producto;        


