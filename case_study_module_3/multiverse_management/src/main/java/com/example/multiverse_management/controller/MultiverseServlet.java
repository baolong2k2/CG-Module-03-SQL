package com.example.multiverse_management.controller;

import com.example.multiverse_management.model.entity.Multiverse;
import com.example.multiverse_management.model.entity.Scientist;
import com.example.multiverse_management.model.entity.User;
import com.example.multiverse_management.model.service.MultiverseService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MultiverseServlet", urlPatterns = {"/", "", "/home"})
public class MultiverseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void init() {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "/add":
                    addMultiverse(request, response);
                    break;
                case "/edit":
                    updateMultiverse(request, response);
                    break;
                case "/search":
                    searchMultiverse(request, response);
                    break;
                default:
                    listMultiverse(request, response);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void searchMultiverse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keySearch = request.getParameter("search");
        List<Multiverse> MultiverseList = MultiverseService.getInstance().getAllMultiverse();
        List<Multiverse> searchList = new ArrayList<>();
        for (Multiverse multiverse : MultiverseList) {
            if (multiverse.getName().toLowerCase().contains(keySearch.toLowerCase())) {
                searchList.add(multiverse);
            }
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/view/home/home.jsp");
        if (searchList.isEmpty()) {
            request.setAttribute("message", "The requested multiverse could not be found");
        } else {
            request.setAttribute("message", "Found " + searchList.size() + " multiverse on demand");
        }
        request.getSession().setAttribute("multiverseList", searchList);
        requestDispatcher.forward(request, response);
    }

    private void updateMultiverse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String img = request.getParameter("img");
        Multiverse multiverse = new Multiverse(id, name, detail,  img);
        MultiverseService.getInstance().updateMultiverse(multiverse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/multiverse/edit.jsp");
        request.setAttribute("message", "New multiverse was updated");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void addMultiverse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ParseException {
        String name =request.getParameter("name");
        String detail =request.getParameter("detail");
        String img =request.getParameter("img");
        Multiverse multiverse = new Multiverse( name, detail,  img);
        MultiverseService.getInstance().insertMultiverse(multiverse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/multiverse/add.jsp");
        request.setAttribute("message","New multiverse was added");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getServletPath();
        if (action == null) {
            action = "";
        }
        String actionHref = request.getParameter("action");
        if (actionHref != null) {
            if (actionHref.equals("show")) {
                action = "/show";
            }
        }

        try {
            switch (action) {
                case "/interface" :
                    showInterface(request, response);
                    break;
                case "/show":
                    showDetailForm(request, response);
                    break;
                case "/add":
                    showAddForm(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/delete":
                    deleteMultiverseServlet(request, response);
                    break;
                case "/":
                case "":
                case "/home":
                    listMultiverse(request, response);
                    break;
                case "/404":
                default:
                    show404Form(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void showInterface(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Multiverse> multiverse = MultiverseService.getInstance().getAllMultiverse();
        request.setAttribute("multiverse", multiverse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/multiverse/interface.jsp");
        dispatcher.forward(request,response);
    }

    private void show404Form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/error/error-404.jsp");
        dispatcher.forward(request,response);
    }

    private void showDetailForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Multiverse multiverse = MultiverseService.getInstance().getDetailMultiverse(id);
        request.setAttribute("multiverse", multiverse);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/multiverse/detail.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteMultiverseServlet(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Scientist) {
                int id = Integer.parseInt(request.getParameter("id"));
                MultiverseService.getInstance().deleteMultiverse(id);
                List<Multiverse> multiverseList = MultiverseService.getInstance().getAllMultiverse();
                request.getSession().setAttribute("multiverseList", multiverseList);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/home/home.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/home/home.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Scientist) {
                int id = Integer.parseInt(request.getParameter("id"));
                Multiverse multiverse = MultiverseService.getInstance().getDetailMultiverse(id);
                RequestDispatcher dispatcher;
                if (multiverse == null) {
                    dispatcher = request.getRequestDispatcher("/WEB-INF/view/error/error-404.jsp");
                } else {
                    request.setAttribute("multiverse", multiverse);
                    dispatcher = request.getRequestDispatcher("/WEB-INF/view/multiverse/edit.jsp");
                }
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/home/home.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login/login.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            if (user instanceof Scientist) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/multiverse/add.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/home/home.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private void listMultiverse(HttpServletRequest request, HttpServletResponse response) {
        List<Multiverse> multiverseList = MultiverseService.getInstance().getAllMultiverse();
        request.getSession().setAttribute("multiverseList", multiverseList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/home/home.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}