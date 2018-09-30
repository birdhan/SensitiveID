package cn.yh.books.book.web.servlet;



import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.yh.books.book.domain.Book;
import cn.yh.books.book.service.BookService;
import cn.yh.books.page.domain.PageBean;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.servlet.BaseServlet;

public class BookServlet extends BaseServlet {
	private BookService bookservice =new BookService();
	/**
	 * 按分类查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCG(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，分类cid
		String cid=request.getParameter("cid");
		//4.使用pc和cid完成查询
		PageBean<Book> pb=bookservice.findByCG(cid, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";
	
		
	}
	
	/**
	 * 按作者查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByAuthor(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，作者名：author
		String author=request.getParameter("author");
		//4.使用pc和author完成查询
		PageBean<Book> pb=bookservice.findByAuthor(author, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";		
	}
	/**
	 * 按照出版社查
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByPress(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，出版社：press
		String press=request.getParameter("press");
		//4.使用pc和press完成查询
		PageBean<Book> pb=bookservice.findByPress(press, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";		
	}
	/**
	 * 按书名模糊查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByLikeName(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，书名：bname
		String bname=request.getParameter("bname");
		//4.使用pc和bname完成查询
		PageBean<Book> pb=bookservice.findByLikeName(bname, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";		
	}
	/**
	 * 多条件任意组合查询
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCombination(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		//1.得到pc，如果页面传递了，使用页面传递，如果没有，pc=1;
		int pc=this.getPC(request);
		//2.得到url
		String url=this.getUrl(request);
		//3.获得查询条件，书名：bname，作者：author 出版社：press
		Book criteria=CommonUtils.toBean(request.getParameterMap(), Book.class);		
		//4.使用pc和书名bname作者author出版社press 任意组合完成查询
		PageBean<Book> pb=bookservice.findByCombination(criteria, pc);
		//5. 给pb设置url,把pb保存到请求中，返回显示图书页面
		pb.setUrl(url);
		request.setAttribute("tp", pb.getTP());
		request.setAttribute("pb", pb);
		return "f:/jsps/book/list.jsp";		
	}
	
	/**
	 * 私有方法，获取当前页
	 * @param request
	 * @return
	 */
	private int getPC(HttpServletRequest request){
		int pc=1;
		String param=request.getParameter("pc");
		if(param!=null&&!param.trim().isEmpty()){
			try{
			pc=Integer.parseInt(param);
			}catch(RuntimeException e){		
			}
		}
		return pc;
		
	}
	/**
	 * 私有方法，获取请求
	 * @param request
	 * @return
	 */
	private String getUrl(HttpServletRequest request){
		String url=request.getRequestURI()+"?"+request.getQueryString();
		int index=url.lastIndexOf("&pc=");
		if(index!=-1){
			url=url.substring(0,index);
		}
		return url;
	}
 
	/**
	 * 按照bid查询一本书的全部信息 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findLoad(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String bid=request.getParameter("bid");
		Book book=bookservice.findLoad(bid);
		request.setAttribute("book", book);
		return "f:/jsps/book/desc.jsp";
		
	}
	/**
	 * 按书名查书的详细信息
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByBname(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String bname=request.getParameter("bname");
		Book book=bookservice.findByBname(bname);
		request.setAttribute("book", book);
		return "f:/jsps/book/desc.jsp";
		
	}
	
}
