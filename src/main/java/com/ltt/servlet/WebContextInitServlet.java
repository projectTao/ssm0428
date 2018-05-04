package com.ltt.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * 设置一个上下文路径
 */
@WebServlet(urlPatterns = {},loadOnStartup = 2)
public class WebContextInitServlet  extends HttpServlet {

    @Override
    public void init() throws ServletException {
        getServletContext().setAttribute("ctx",getServletContext().getContextPath());
    }
}
