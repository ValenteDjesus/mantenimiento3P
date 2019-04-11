        Drop database if exists TyVBDD;
        create database TyVBDD;
        use TyVBDD;
        
        CREATE TABLE usuario(
            id_usuario INT PRiMARY KEY Auto_Increment, 
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
            estado_trabajador boolean,        
            username VARCHAR(40),         
            password VARCHAR(40),  
            administrador boolean
        );
                    
        CREATE TABLE venta(
            id_venta INT PRiMARY KEY Auto_Increment,
            fecha datetime,        
            mesa INT(3),         
            id_usuario int,
            total_pago float (10,2),                
            foreign KEY (id_usuario) references usuario(id_usuario)
        );

        CREATE TABLE factura(
            id_factura INT PRiMARY KEY,
            id_venta int,
            foreign KEY (id_venta) references venta(id_venta)
        );

        CREATE TABLE medicion(
            id_medicion INT PRIMARY KEY Auto_Increment,
            nombre_medicion VARCHAR(40),
            abreviacion VARCHAR(10)
        );

        CREATE TABLE insumo(
            id_insumo INT PRiMARY KEY Auto_Increment, 
            nombre_insumo VARCHAR(40),         
            cantidad float(8,2),   
            id_medicion int,
            insumo_minimo float(8,2),   
            foreign KEY (id_medicion) references medicion(id_medicion)
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
    
        CREATE TABLE producto_insumo(
            id_producto int, 
            id_insumo int,
            gasto_de_insumo float(8,2),
            foreign KEY (id_producto)references producto(id_producto),  
            foreign KEY (id_insumo)references insumo(id_insumo)   
        );
        
        CREATE TABLE producto_venta(
            id_producto int, 
            id_venta int,
            cantidad int,
            foreign KEY (id_producto)references producto(id_producto),  
            foreign KEY (id_venta)references venta(id_venta)   
        );
        
        insert into usuario values                             
        (null, "Martin","Gonzalez","Cuevas",
        15, "A", "16 de septiembre" , "Centro", "Pachuca", "Pachuca", "Hidalgo"
        ,7751355551,"martingc@hotmail.com",true,
        "martingc", "123", true),

        (null, "Juan Antonio","Neumaier","Peñaloza",
        9, 2, "Calle Random" , "Cubitos", "Pachuca", "Pachuca", "Hidalgo"
        ,7711109701,"juanantonionp@hotmail.com",true,
        "juannp", "123", true),

        (null, "Andrea","Gutierrez","Angeles",
        66, "B", "Otra calle Random" , "El arbolita", "Pachuca", "Pachuca", "Hidalgo"
        ,7711999784,"andreaga@hotmail.com",true,
        "andreaga", "123", false),

        (null, "Deyvid Uriel","Ordoñez","Baños",
        90, "102", "Random Street" , "El manzano", "Pachuca", "Pachuca", "Hidalgo"
        ,7491044891,"deyvidurielob@hotmail.com",true,
        "deyvidob", "123", false),

        (null, "Sujeto Random","Apellido","Random",
        46, "901", "Calle Random 3" , "La calero", "Pachuca", "Pachuca", "Hidalgo"    
        ,101010101,"randommail@hotmail.com",false,
        "randoman", "123", false);

        
        insert into medicion values
        (null, "Kilogramos", "Kg."),
        (null, "MedioKilo", "1/2 Kg."),
        (null, "Gramos", "g."),
        (null, "Litro", "lt."),
        (null, "Pieza", "pz."),
        (null, "Botella", "bot.");


        insert into insumo values
        (null,"tortillas",200,5,20),
        (null,"Arrachera",1,1,0.2),
        (null,"Cesina",1,1,0.2),
        (null,"Ch. Español",1,1,0.2),
        (null,"Ch. Argentino",1,1,0.2),
        (null,"Chistorra",1,1,0.2), 
        (null,"Chile",1,1,0.2),
        (null,"Ch. Normal",1,1,0.2),
        (null,"Rostbeff",1,1,0.2),
        (null,"Queso oaxaca",1,1,0.2),
        (null,"Alas",60,5,0.2);
        
        -- NOTAS DE LOS INSUMOS CON LOS PRODUCTOS
        --  insert into insumo values 
        -- (null, "tortillas",1,1),
        -- (null,"Arrachera",1,1),
        -- (null,"Cesina",1,1),
        -- (null,"Ch. Español",1,1),
        -- (null,"Ch. Argentino",1,1),
        -- (null,"Chistorra",1,2), --medio kilo
        -- (null,"Chile",1,1),
        -- (null,"Choriqueso",1,1), --pieza
        -- (null,"Rostbeff",1,1),
        -- (null,"Queso oaxaca",1,2),--porciones de medio kilo,  40g porcion
        -- (null,"Alas",1,5); -- 40 Pz


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

    -- (null,"Orden de quesadillas",40,"Especiales",3,1), --3 tortillas 3 porciones de ques
    --     (null,"Orden Alas",60,"Especiales",3,1); -- 8 piezas

        insert into  producto_insumo VALUES

        (1,1,1),
        (2,1,1),
        (3,1,1),
        (4,1,1),
        (5,1,1),
        (6,1,1),
        (7,1,1),
        (16,1,1),
        (17,1,3),

        (1,2,0.04),
        (2,3,0.04),
        (3,4,0.04),
        (4,5,0.04),
        (5,6,0.04),
        (6,8,0.04),    
        (7,9,0.04),

        (6,10,0.04),    
        (16,10,0.04),
        (17,10,0.12),
        (18,11,8);

        insert into venta VALUES
        (null, CURRENT_TIMESTAMP, 1, 1, 0),
        (null, CURRENT_TIMESTAMP, 2, 2, 0),
        (null, CURRENT_TIMESTAMP, 3, 3, 0),
        (null, CURRENT_TIMESTAMP, 4, 4, 0),
        (null, CURRENT_TIMESTAMP, 5, 5, 0);
        

        --TRIGGER
        DELIMITER $
        create trigger upd_saldo_venta after insert on producto_venta
            FOR EACH ROW 
            BEGIN                 

                DECLARE valor FLOAT;
                DECLARE stock FLOAT;
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

        -- DELIMITER $
        -- create trigger upd_producto after update on producto
        --     FOR EACH ROW 
        --     BEGIN                 
                
        --     END $
        -- DELIMITER ;

            ---FALTA EL TRIGGER PARA LOS INSUMOS----
                -- DECLARE vgasto FLOAT;
                -- DECLARE vinsumo FLOAT;
                -- SELECT gasto_de_insumo INTO vgasto FROM producto_insumo WHERE id_producto = NEW.id_producto;                                                
                -- SELECT id_producto INTO vinsumo FROM producto_insumo WHERE id_producto = NEW.id_producto;                                            
        --update insumo set cantidad = cantidad-isumo WHERE id_insumo = vinsumo ;

        select * from venta;
        select * from producto;
        select * from insumo;

        CREATE VIEW insumo_medicion as 
        SELECT i.id_insumo, i.nombre_insumo, i.cantidad, m.nombre_medicion,m.abreviacion,i.insumo_minimo
                FROM insumo as i INNER JOIN medicion as m
                ON m.id_medicion=i.id_medicion;          
         SELECT * FROM insumo_medicion; 
        
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

        select * from venta;
        select * from producto;
        select * from insumo;
