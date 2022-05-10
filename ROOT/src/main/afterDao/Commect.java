package afterDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Dao.connectiondatabaes;

@WebServlet(name = "Commec", value = "/Commec")
public class Commect extends HttpServlet {
    int id;
    int i;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        i = Integer.parseInt(request.getParameter("i"));
        try {
            ArrayList<Integer> ids = doget.getName();
            id=ids.get(i);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String title = URLDecoder.decode(request.getParameter("title"), "utf-8");
        HttpSession session1 = request.getSession(true);
        session1.setAttribute("select_id",id);
        session1.setAttribute("select_i",i);
        System.out.println(id);
        String context = "";
        try {
            context = getdao.getcontext(id, title);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession(true);
        session.setAttribute("cloose_title",title);
        session.setAttribute("cloose_context",context);
        try {
            session.setAttribute("commect_total",getcommect());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("comment.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public ArrayList<String> getcommect() throws SQLException {
        ArrayList<String> commects = new ArrayList<>();
        String sql="SELECT * FROM comment WHERE cid='"+id+"' AND i='"+i+"'";
        Connection connection = connectiondatabaes.connection_database();
        ResultSet resultSet = connectiondatabaes.executeSQL(connection, sql);
        while (resultSet.next()){
            String name = resultSet.getString("name");
            String comect = resultSet.getString("comect");
            String date=resultSet.getString("date");
            String j=name+":"+comect+"--------------------评论时间："+date;
            commects.add(j);
        }

        return  commects;
    }
}
