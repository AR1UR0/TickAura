/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package proyecto;

public class evento {
    private int id_eventos;
    private String nombre;
    private String date;
    private String ubicacion;
    private int precio;
    private boolean destacado;
    private String tipo;
}

/*
CREATE TABLE eventos (
    id_eventos VARCHAR2(10),
    nombre VARCHAR2(100),
    fecha DATE ,
    ubicacion VARCHAR2(255) ,
    precio DECIMAL(10,2),
    destacado BOOLEAN,
    imagen LONGBLOB,
    tipo VARCHAR2(50),
    CONSTRAINT PK_eventos_id_eventos PRIMARY KEY (id_eventos)
    CONSTRAINT CK_tipos_evento CHECK(tipo in('Concierto', 'Teatro', 'Evento', 'Festival')),
);
*/
