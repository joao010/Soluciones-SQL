--SELECT *
--FROM (
--SELECT IIF(SUBSTRING(nombre_completo, 1, CHARINDEX(' ',nombre_completo)) IN ('SRA','SR','SRA.','SR.'), 
--	SUBSTRING(nombre_completo, CHARINDEX(' ', nombre_completo)+1, LEN(nombre_completo)), 
--	nombre_completo) nombre_completo
--FROM aClients) a

SELECT
 nombre_completo, 
 -- nombre_completo
 --,CASE WHEN 0 = CHARINDEX(' ',nombre_completo)
 --      THEN NULL  
 --      ELSE SUBSTRING( nombre_completo,1,CHARINDEX(' ',nombre_completo)-1)
 --      END AS NAME
 --,SUBSTRING(nombre_completo,1 + CHARINDEX(' ',nombre_completo),LEN(nombre_completo)) AS LAST_NAME,

 ----CASE WHEN  0 = CHARINDEX(' ',nombre_completo)
 ----THEN NULL
 ----ELSE SUBSTRING(nombre_completo, 1,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1))
 ----END AS MIDDLE_NAME,

 ---- Nombres con articulos -- Listo

 CASE

 WHEN LEN(nombre_completo) = LEN(REPLACE(nombre_completo,' ','')) 
 THEN nombre_completo

 WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 1
 THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ', nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'de%' 
 THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ',nombre_completo))

 WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 2 
 THEN  SUBSTRING(nombre_completo,1,CHARINDEX(' ', nombre_completo))

 WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) >= 3 AND SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'de%'
 THEN SUBSTRING(nombre_completo,1,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'de los%' OR SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'del la%'
 THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1)+1)+1))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'de%' 
 THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ',nombre_completo,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1)+1))

 END AS Nombre,

 -- Segundo nombre contiene dos articulos -- Listo
 --CASE WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'de los%' OR SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'del la%'
 --THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1)+1)+1))
 --END AS Segundo_nombre_2Articulos,


 --CASE WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'de%' OR
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'del' OR SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'la' OR
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'lo' OR SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'las' OR
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'los' 
 --THEN SUBSTRING(nombre_completo,1,CHARINDEX(' ',nombre_completo,CHARINDEX(' ', nombre_completo, CHARINDEX(' ', nombre_completo)+1)+1))
 --END,

 -- Nombres y apellidos de 3 espacios 
 --CASE WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 3 AND SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'de%'
 --THEN SUBSTRING(nombre_completo,1,Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1))
 --END,

 --Caso para un nombre y un apellido -- Revisar
 --CASE WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 1 AND SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) NOT LIKE 'de%'
 --THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo))
 --END,
 
 -- Caso de articulo en el tercer espacio -- Listo
 --CASE WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo)) LIKE 'de%' 
 --THEN SUBSTRING(nombre_completo, Charindex(' ', nombre_completo, Charindex(' ', nombre_completo)+1)+1,LEN(nombre_completo))
 --END,

 -- Caso de articulo en el cuarto espacio -- Listo
 --CASE WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo)) LIKE 'de%'  
 --THEN SUBSTRING(nombre_completo, CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo))
 --END,

 --Caso de articulo en el tercer, cuarto y quinto espacio -- Listo
 
 CASE
 
 WHEN LEN(LTRIM(nombre_completo)) - LEN(REPLACE(nombre_completo,' ','')) = 0
 THEN ''

 WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 1
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ', nombre_completo)+1, LEN(nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)) LIKE 'de%' 
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo))

 WHEN LEN(nombre_completo) - LEN(REPLACE(nombre_completo,' ','')) = 2 
 THEN  SUBSTRING(nombre_completo,CHARINDEX(' ', nombre_completo)+1 , LEN(nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo)) LIKE 'de%' 
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo)) NOT LIKE 'de%' 
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo)) LIKE 'de%'  
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo))

 WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1)+1,LEN(nombre_completo)) LIKE 'de%'  
 THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo))

 --WHEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1)+1)+1,LEN(nombre_completo)) LIKE 'de%'  
 --THEN SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo))


 END AS Apellido
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo)+1,LEN(nombre_completo)),
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo)),
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1,LEN(nombre_completo)),
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo)),
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo)),
 --SUBSTRING(nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo,CHARINDEX(' ',nombre_completo)+1)+1)+1,LEN(nombre_completo))
 FROM (
SELECT IIF(SUBSTRING(nombre_completo, 1, CHARINDEX(' ',nombre_completo)) IN ('SRA','SR','SRA.','SR.'), 
	LTRIM(SUBSTRING(nombre_completo, CHARINDEX(' ', nombre_completo)+1, LEN(nombre_completo))), 
	LTRIM(nombre_completo)) nombre_completo
FROM aClients) a

--WHERE nombre_completo IN (
--SELECT LTRIM(nombre_completo) 
--FROM aClients
--WHERE LEN(LTRIM(nombre_completo)) - LEN(REPLACE(LTRIM(nombre_completo),' ','')) = 0
--)


