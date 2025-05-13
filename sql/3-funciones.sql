DROP FUNCTION IF EXISTS obtener_rutas_imagenes;

DELIMITER //
CREATE FUNCTION obtener_rutas_imagenes(palabra VARCHAR(2000)) RETURNS TEXT
READS SQL DATA  -- Indicamos que la función solo lee datos
BEGIN
   DECLARE resultado TEXT DEFAULT '';
   DECLARE letra_actual CHAR(2); -- Usamos CHAR(2) para manejar combinaciones de 1 o 2 caracteres
   DECLARE idx INT DEFAULT 1;    -- Es un contador
   DECLARE total_letras INT;     -- Para comprobar que vamos a terminar el ciclo WHILE sin problemas
   DECLARE ruta_imagen_actual VARCHAR(500);

   SET palabra = LOWER(palabra);             -- Paso 1: Convertir la palabra a minúsculas
   SET total_letras = CHAR_LENGTH(palabra);  -- Paso 2: Contar la longitud de la palabra

   -- Hacemos un bucle WHILE para recorrer la palabra
   WHILE idx <= total_letras DO
      -- Reviso si la letra actual es una combinación de 2 caracteres ('ch', 'll', 'rr')
      SET letra_actual = SUBSTRING(palabra, idx, 2);

      IF letra_actual IN ('ch', 'll', 'rr') THEN
         -- Si es una combinación de dos letras, consigo la ruta de la imagen para la combinación
         SELECT ruta_imagen INTO ruta_imagen_actual FROM alfabeto WHERE letra = letra_actual LIMIT 1;

         -- Si existe una ruta, la agregamos al resultado
         IF ruta_imagen_actual IS NOT NULL THEN 
            SET resultado = CONCAT(resultado, ruta_imagen_actual, ',');
         END IF;

         -- Incrementamos el índice por 2 para saltar al siguiente par de letras
         SET idx = idx + 2;
      ELSE
         -- Si no es una combinación especial, tomamos solo un carácter
         SET letra_actual = SUBSTRING(palabra, idx, 1);

         -- Obtenemos la ruta de la imagen para una sola letra
         SELECT ruta_imagen INTO ruta_imagen_actual FROM alfabeto WHERE letra = letra_actual LIMIT 1;

         -- Si existe una ruta, la agregamos al resultado
         IF ruta_imagen_actual IS NOT NULL THEN
            SET resultado = CONCAT(resultado, ruta_imagen_actual, ',');
         END IF;

         -- Incrementamos el índice por 1 para la siguiente letra
         SET idx = idx + 1;
      END IF;
   END WHILE;

   -- Eliminar la última coma si existe
   IF RIGHT(resultado, 1) = ',' THEN 
      SET resultado = LEFT(resultado, CHAR_LENGTH(resultado) - 1);
   END IF;

   -- Retornamos el resultado final
   RETURN resultado;
END //
DELIMITER ;
