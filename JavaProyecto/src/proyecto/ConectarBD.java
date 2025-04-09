package proyecto;

import java.sql.Connection;

public class ConectarBD {
    public static void main(String[] args) {
        Connection conn = OracleConnection.conectar();
        // Puedes ejecutar una consulta aquí si quieres probar más
    }
}
