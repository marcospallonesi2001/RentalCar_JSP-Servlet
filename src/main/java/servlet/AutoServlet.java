package servlet;

import dao.AutoDaoImpl;
import entities.Auto;
import entities.Utente;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "autoServlet", value = "/autoServlet")
public class AutoServlet extends HttpServlet {
    private final AutoDaoImpl autoDao = new AutoDaoImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Auto> auto = autoDao.elencoAuto();
        request.setAttribute("auto", auto);
        RequestDispatcher dispatcher = request.getRequestDispatcher("parcoAuto.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedback.jsp");
        switch (request.getParameter("action")){
            case "modifica":
            case "aggiungi":
                Auto a = new Auto();
                if(request.getParameter("id")!=null){
                    a.setIdAuto(Integer.parseInt(request.getParameter("id")));
                }
                a.setMarca(request.getParameter("marca"));
                a.setModello(request.getParameter("modello"));
                a.setAnno(Integer.parseInt(request.getParameter("anno")));
                a.setPrezzo(Double.valueOf(request.getParameter("prezzo")));
                a.setTarga(request.getParameter("targa"));
                autoDao.inserisciOAggiornaAuto(a);
                request.setAttribute("action", "modifica_auto");
                break;
            case "elimina":
                autoDao.eliminaAuto(Integer.parseInt(request.getParameter("id")));
                request.setAttribute("action", "elimina_auto");
                break;
            default:
                System.out.println("ERRORE");
                break;
        }
        dispatcher.forward(request, response);
    }
}