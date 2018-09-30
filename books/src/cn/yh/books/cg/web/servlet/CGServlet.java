package cn.yh.books.cg.web.servlet;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yh.books.cg.domain.CG;
import cn.yh.books.cg.service.CGService;
import cn.yh.tools.servlet.BaseServlet;

public class CGServlet extends BaseServlet {
	private CGService cgservice=new CGService();
	
	public String findAll(HttpServletRequest request,HttpServletResponse response){
		//得到所有父分类对象
		List<CG> parents=cgservice.findALL();
		//保存该对象到请求中，请求转发回lesf.jsp
		
		request.setAttribute("parents", parents);
		
		return "f:/jsps/left.jsp";	
	}
	
}

