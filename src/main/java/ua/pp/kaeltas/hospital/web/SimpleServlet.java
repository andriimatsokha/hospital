package ua.pp.kaeltas.hospital.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SimpleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Logger logger = LoggerFactory.getLogger(SimpleServlet.class);
		logger.debug("simple servlet [GET]");
		
		resp.getWriter().write("Hello from Servlet");
	}

	
	
}
