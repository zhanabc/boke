package afterDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import Dao.getid;
import Dao.connectiondatabaes;
import Dao.person;

@WebServlet(name = "afterDao.dealinsert", value = "/afterDao.dealinsert")
public class dealinsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        String username = (String) session.getAttribute("username");
        int sex = Integer.parseInt(request.getParameter("sex"));
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String education = request.getParameter("education");
        String school = request.getParameter("school");
        String  time_enrollment = request.getParameter("time_enrollment");
        String company = request.getParameter("company");
        String postion = request.getParameter("postion");
        String enterDate = request.getParameter("enterDate");
        boolean execute = false;
        boolean execute1 = false;
        person<Object> person = new person<>();
        int i = 0;
        try {
            i = getid.GetID(username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql="INSERT INTO job VALUES('"+company+"','"+postion+"','"+enterDate+"',"+i+")";
        String sql1="INSERT INTO education VALUES('"+education+"','"+school+"','"+time_enrollment+"',"+i+")";
        Connection connection = connectiondatabaes.connection_database();
        try {
            execute = connectiondatabaes.execute(connection, sql);
            execute1 = connectiondatabaes.execute(connection, sql1);
            boolean b = person.setAge(age);
            boolean b1 = person.setSex(sex);
            boolean b2 = person.setAddress(address);
            System.out.println(execute+":"+execute1+":"+b+":"+b1+":"+b2);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (execute||execute1){
            response.sendRedirect("index.jsp");
        }else {
            response.sendRedirect("info.jsp?result=false");
        }
    }
}
