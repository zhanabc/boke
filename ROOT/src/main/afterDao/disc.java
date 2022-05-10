package afterDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import Dao.connectiondatabaes;

@WebServlet(name = "disc", value = "/disc")
public class disc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("username");
        if (username==null){
            session.setAttribute("result_error","false");
        }else {
            request.setCharacterEncoding("utf-8");
            String comment = request.getParameter("context");
            System.out.println(comment);

            int i = (int) session.getAttribute("select_i");

            int id = (int) request.getSession(true).getAttribute("select_id");
            String sql="INSERT INTO comment VALUES("+id+","+i+",'"+comment+"','"+username+"','"+gettime()+"')";
            Connection connection = connectiondatabaes.connection_database();
            try {
                connectiondatabaes.execute(connection,sql);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("comment.jsp");
    }
    public String gettime(){
        String date = String.valueOf(new Date());
        return date;
    }
}
