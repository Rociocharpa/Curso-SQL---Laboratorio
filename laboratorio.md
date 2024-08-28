Base de datos

 Laboratorio de Aguas y Efluentes
 ![image](https://github.com/user-attachments/assets/2c8e7a2f-ac3d-4fae-a3cc-0666b7dc1ba7)


Introducción

El laboratorio de Aguas y Efluentes es una entidad que presta servicio a la comunidad. En este, se llevan adelante análisis fisicoquímico y microbiológico de muestras de agua o de efluentes industriales o cloacales, buscando así determinar la concentración de parámetros relevantes en cada tipo de muestras y observar si estos se encuentran dentro de los limites establecidos por las normativas correspondientes.

Problemática

Se trabaja en una base de datos destinada a almacenar la información correspondiente a cada cliente que requiere determinar la concentración de uno o más parámetros, de una o más muestras. 

Descripción 

1.	Gestión de Clientes: Se requiere llevar un registro detallado de los clientes que solicitan análisis de muestras. 

2.	Gestión del Ingreso de muestras: Es importante garantizar la trazabilidad de la muestra, por lo tanto, se le da ingreso con un número de muestra y así poder identificarla.

3.	Gestión de Resultados: Para llevarlos de forma ordenada ya que, a partir de estos, se debe elaborar un informe de entrega al cliente.

Objetivos

Diseñar e implementar una base de datos relacional que satisfaga todas las necesidades de gestión de muestras de un laboratorio con sus respectivos resultados. Esta deberá ser eficiente, dinámica y fácil de manejar.

Descripción de la base de datos

Tablas

1.	CLIENTES
•	Almacena información de los clientes que traen muestras.
•	Atributos: ID_CLIENTE, NOMBRE_CLIENTE, EMPRESA, MAIL, TELEFONO 

2.	MUESTRAS
•	Almacena información correspondiente a la muestra como el cliente que la trae al laboratorio, como la fecha en la que ingresa. Además, el tipo de muestra que puede ser agua, efluente industrial o efluente cloacal.
•	Atributos: ID_MUESTRAS, N_ORDEN, ID_CLIENTE, FECHA_RECEPCION, TIPO_DE_MUESTRA, PROCEDENCIA, DESCRIPCION

3.	DETERMINACIONES
•	Contiene información de la determinación que se realiza a cada muestra
•	Atributos: ID_DETERMINACION, ID_MUESTRAS, NOMBRE

4.	TECNICOS
•	Almacena información de los técnicos capacitados para la realización de las determinaciones.
•	Atributos: ID_TECNICO, NOMBRE, APELLIDO, ESPECIALIDAD, TELEFONO

5.	RESULTADOS
•	Almacena los resultados obtenidos en cada determinación realizada en cada muestra.
•	Atributos: ID_RESULTADOS, ID_DETERMINACION, RESULTADO, UNIDAD, ID_TECNICO



Diagrama Entidad - Relación


![image](https://github.com/user-attachments/assets/e8cc0a10-86ba-42c3-adbc-a692b4dc5639)


Vistas

1.	VIEW_DETERMINACIONES: Con esta vista se visualiza el número de la muestra, el tipo y los parámetros que hay que determinar. Involucra la tabla MUESTRAS y la tabla DETERMINACIONES.
   
2.	VIEW_DETERM_RESULTADOS: Se visualiza el número de la muestra, el tipo y todos los parámetros, estén realizados o no, con su resultado si corresponde.  Involucra la vista anteriormente mencionada y la tabla RESULTADOS.
 
3.	VIEW_DETERM_FALTANTES: Con la utilización de esta view se visualiza cuáles son las determinaciones que aún no se han realizado, por lo tanto, las que quedan pendientes para llevar adelante a la brevedad.

Funciones

1.	FN_DETERMINACION_ESTADO_MUESTRA: Esta función me permite saber el estado de la muestra verificando el resultado de cada determinación que se realiza a cada una de las muestras y devolviendo un estado pendiente cuando no contiene un valor y terminado cuando la determinación está realizada y la información cargada.
   
Stored Procedures

1.	INSERTAR_MUESTRA: Este stored procedure se utiliza para insertar una nueva muestra.
   
2.	REGISTRAR_TECNICO: Este SP se utiliza para el registro de nuevos técnicos.
   
3.	PR_CONVERTIR_UNIDADES: Este SP me permite hacer una conversión de unidades para pasar de mg/L a g/L o, viceversa.

Usuarios y permisos
Se crean dos usuarios en la base de datos donde se encuentra el director y un técnico. 
El director va a tener acceso a las tablas qu corresponde al rubro, es decir que va a poder manipular las tablas de muestras, determinaciones, resultados, tecnicos y clientes. 
La manipulación de estas tablas incluye insertar nuevos registros, eliminarlos, actualizarlos y por supuesto, la lectura de los registros.
El tecnico manupula las mismas tablas pero solo tiene permiso de lectura y de inserción de datos.


