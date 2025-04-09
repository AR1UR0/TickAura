
package ConectarMySQL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    Connection SQLConexion;
    public Conexion(){
        // Ruta URL BD
        String host="localhost";
        String puerto="3306";
        String nameDB="";
        // Acceder URL
        String usuario="root";
        String pass="";
        //Driver
        String driver="com.mysql.cj.jdbc.Driver";
        String databaseURL="jdbc:mysql://"+host+":"+puerto+"/"+nameDB+"?useSSL=false";
        try{
            Class.forName(driver);
	
            SQLConexion=DriverManager.getConnection(databaseURL, usuario, pass);

        }catch(Exception ex){
            System.out.println("ERROR!!!!!!");
        }
    }
    public Connection getConectarBD(){
            return SQLConexion;
        }
                
    }
   
    
    

