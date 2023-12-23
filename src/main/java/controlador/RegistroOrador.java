
package controlador;

import dao.OradoresDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Orador;


@WebServlet("/registroOrador")
public class RegistroOrador extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //Obtenemos datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String tema = request.getParameter("tema");
        
        //Creamos un objeto Orador con los datos
        Orador orador = new Orador();
        orador.setNombre(nombre);
        orador.setApellido(apellido);
        orador.setTema(tema);
        
        // Obtenemos la fecha atual
        java.util.Date fechaActual = new java.util.Date();
        orador.setFechaAlta(fechaActual);
        
        //Agregamos el orador a la base de datos
        OradoresDAO oradoresDAO = new OradoresDAO();
        try {
            //Ver try por si me arroja error
            oradoresDAO.agregarOrador(orador);
        } catch (SQLException ex) {
            Logger.getLogger(RegistroOrador.class.getName()).log(Level.SEVERE, null, ex);
        }

        
        //Redireccionamos a la pagina de visualización de oradores
        response.sendRedirect(request.getContextPath() + "/vistas/verOradores.jsp");
    }
}
