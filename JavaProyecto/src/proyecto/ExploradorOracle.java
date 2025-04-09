package proyecto;

import java.sql.*;

public class ExploradorOracle {

    public static void main(String[] args) {
        Connection conn = null;
        try {
            // Conexión a Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:XE", // Cambia SID si es necesario
                    "SYSTEM",
                    "DAW6K"
            );

            // Obtener las tablas del esquema actual
            DatabaseMetaData metaData = conn.getMetaData();
            ResultSet tablas = metaData.getTables(null, null, "%", new String[]{"TABLE"});

            while (tablas.next()) {
                String nombreTabla = tablas.getString("TickAura_Ferran_Thais_Iker_Arturo");
                System.out.println("\n📋 Tabla: " + nombreTabla);
                System.out.println("-------------------------------------");

                // Ejecutar SELECT * de cada tabla
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM " + nombreTabla);

                // Obtener columnas
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnas = rsmd.getColumnCount();

                // Imprimir columnas
                while (rs.next()) {
                    for (int i = 1; i <= columnas; i++) {
                        String nombreColumna = rsmd.getColumnName(i);
                        String valor = rs.getString(i);
                        System.out.print(nombreColumna + ": " + valor + " | ");
                    }
                    System.out.println();
                }
                rs.close();
                stmt.close();
            }

            tablas.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}