package proyecto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {
    public static Connection conectar() {
        Connection conexion = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver"); // cargar driver
            conexion = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521/XEPDB1", // cambia según tu config
                "SYSTEM",  // tu usuario
                "DAW6K" // tu contraseña
            );
            System.out.println("Conexión exitosa a Oracle.");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar: " + e.getMessage());
        }
        return conexion;
    }
}

