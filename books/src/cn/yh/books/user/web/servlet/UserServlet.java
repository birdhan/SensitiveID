package cn.yh.books.user.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.yh.books.user.domain.User;
import cn.yh.books.user.service.UserService;
import cn.yh.books.user.service.UserService.UserException;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.servlet.BaseServlet;
/**
 * 用户模块表示类
 * @author lsa
 *
 */
public class UserServlet extends BaseServlet {
    private UserService userservice=new UserService();
    
    /*
     * 1.ajax用户名
     */
      public String ajaxValidateLoginname(HttpServletRequest request,HttpServletResponse response) throws IOException{
    	   //获取用户输入的用户名
    	  String loginname=request.getParameter("loginname");
    	  //通过Service层，验证并得到结果
    	  boolean b=userservice.ajaxValidateLoginname(loginname);
    	  //把结果发给客户端
    	  response.getWriter().print(b);
    	  return null;//不转发，也不重定向
      }
    
    /*
     * 2.ajax邮箱
     */
      public String ajaxValidateEmail(HttpServletRequest request,HttpServletResponse response) throws IOException{
   	   //获取用户输入的用户名
   	  String email=request.getParameter("email");
   	  //通过Service层，验证并得到结果
   	  boolean b=userservice.ajaxValidateEmail(email);
   	  //把结果发给客户端
   	  response.getWriter().print(b);
   	  return null;//不转发，也不重定向
     }
     /*
      * 3.ajax验证码
      */
      public String ajaxValidateCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
    	  //获取表单中客户端写入的验证码
    	  String verifycode=request.getParameter("verifyCode");
    	  //得到图片上生成的验证码
    	  String vCode=(String)request.getSession().getAttribute("vCode");
    	  //进行比较，忽略大小写
    	  boolean b=verifycode.equalsIgnoreCase(vCode);
    	  //发回客户端
    	  response.getWriter().print(b);
    	  return null;//不转发，也不重定向
      }
      
      
      public String regist(HttpServletRequest request,HttpServletResponse response){
    	  //1.接收表单传送的数据，封装到User对象中。
    	  User formUser=CommonUtils.toBean(request.getParameterMap(), User.class);
    	  //2.表单的服务端验证（安全验证）：
    	  Map<String,String> errors=this.ValidateRegist(formUser, request.getSession());
    	  if(errors.size()>0){
    		  request.setAttribute("form", formUser);//表单信息回写
    		  request.setAttribute("error", errors);//错误消息
    		  return "f:/jsps/user/regist.jsp";
    		  
    	  }
    	  this.ValidateRegist(formUser, request.getSession());
    	  //3.使用业务层中的相应方法完成业务
    	  userservice.regist(formUser);
    	  //4.保存成功信息，转发回msg.jsp
    	  request.setAttribute("code", "success");
    	  request.setAttribute("msg", "恭喜您，注册成功，请激活！");
    	  return "f:/jsps/msg.jsp";//走请求转发
    	 
    	  
      }
      
      /**
       * 服务器端校验方法，对表单字段进行逐个校验，如果有错误，使用当前字段名作为键，使用错误提示消息为值，保持到Map集合中
       * @param formUser
       * @param session
       * @return
       */
      private Map<String,String> ValidateRegist(User formUser,HttpSession session){
         
    	  Map<String,String> errors=new HashMap<String, String>();//子类对象创建父类对象，向上转型
    	  //1.验证用户名
    	  String loginname=formUser.getLoginname();
    	  if(loginname==null||loginname.trim().isEmpty()){//非空校验
    		  errors.put("loginname", "请输入用户名！");
    	  }else if(loginname.length()<3||loginname.length()>20){//长度
    		  errors.put("loginname", "用户名长度必须在3 ~ 20之间！");
    	  }else if(!userservice.ajaxValidateLoginname(loginname)){
    		  errors.put("loginname", "用户名已被占用！");
    	  }
    	  
    	//2.验证密码
    	  String loginpass=formUser.getLoginpass();
    	  if(loginpass==null||loginpass.trim().isEmpty()){//非空校验
    		  errors.put("loginpass", "请输入密码！");
    	  }else if(loginpass.length()<3||loginpass.length()>20){//长度
    		  errors.put("loginpass", "密码长度必须在3 ~ 20之间！");
    	  }
    	//3.确认密码
    	  String reloginpass=formUser.getReloginpass();
    	  if(reloginpass==null||reloginpass.trim().isEmpty()){//非空校验
    		  errors.put("reloginpass", "请输入确认密码！");
    	  }else if(reloginpass.length()<3||reloginpass.length()>20){//长度
    		  errors.put("reloginpass", "密码长度必须在3 ~ 20之间！");
    	  }else if(!loginpass.equals(reloginpass)){
    		  errors.put("reloginpass","两次输入的密码不一致！");
    		  
    	  }
    	  
    	  
    	  
    	//4.验证邮箱
    	  String email=formUser.getEmail();
    	  if(email==null||email.trim().isEmpty()){//非空校验
    		  errors.put("email", "请输入邮箱地址！");
    	  }else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")){//格式
    		  errors.put("email", "邮箱格式书写错误！");
    	  }else if(!userservice.ajaxValidateEmail(email)){
    		  errors.put("email", "邮箱已被占用！");
    	  }
    	  
    	//5.验证验证码
    	  String verifyCode=formUser.getVerifyCode();
    	  if(verifyCode==null||verifyCode.trim().isEmpty()){//非空校验
    		  errors.put("verifyCode", "请输入验证码！");
    	  }else if(verifyCode.length() != 4){//长度
    		  errors.put("verifyCode", "验证码长度为4！");
    	  }else if(!formUser.getVerifyCode().equalsIgnoreCase((String)session.getAttribute("vCode"))){
    		  errors.put("verifyCode", "验证码错误！");
    		  
    	  }
    	  return  errors;
      }
    
      
      /**
       * 用户激活
       * @author lsa
       *
       */
      public String activation(HttpServletRequest request,HttpServletResponse response) throws UserException{
    	  //1.获取参数的激活码
    	  String code=request.getParameter("activationCode");
    	  userservice.activation(code);
		  request.setAttribute("code", "success");
		  request.setAttribute("msg", "激活成功，请登录！");
    	  //3.转发
    	  return "f:/jsps/msg.jsp";
      }   
      /**
       * 客户登录
       * @param request
       * @param response
       * @return
       */
      public String login(HttpServletRequest request,HttpServletResponse response){
    	  //1.把表单传送过来的信息封装到User对象
    	  User fuser=CommonUtils.toBean(request.getParameterMap(), User.class);
    	  //2.表单的服务端校验
    	  //3.调用Service层的login()方法得到User.
    	  User user=userservice.FindByNameAndPass(fuser);
    	  //4.如果User为空，登录失败，否则登录成功，（无论成功失败，都要保存相应信息，消息、错误提示、表单回显），请求转发（登录成功，进去index.jsp,登录失败，login.jsp）
    	  if(user==null){//失败
    		request.setAttribute("msg", "用户名或密码错误，请重新输入！");
    		request.setAttribute("form", fuser);
    		return "f:/jsps/user/login.jsp";
    	  }else{//成功
    		 if(!user.isStatus()){
    			 request.setAttribute("msg", "您还没有激活！");
    			 request.setAttribute("form", fuser);
    	         return "f:/jsps/user/login.jsp";
    		 }
    		 String loginname=user.getLoginname();
    		 try {
				loginname=URLEncoder.encode(loginname, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				throw new RuntimeException(e);
			}
    		 Cookie cookie=new Cookie("loginname",loginname);
			 cookie.setMaxAge(60*60*24*7);//7天
			 response.addCookie(cookie);//转载到响应对象中，可回客户端
    		 request.getSession().setAttribute("user",user);
    		return "r:/index.jsp";
    	  }
    	  
      }
      
      /**
       * 修改密码
       * @param request
       * @param response
       * @return
       * @throws ServletException
       * @throws IOException
       */
      public String updatePass(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
    	  //1.封装表单数据到user中
    	  User fuser=CommonUtils.toBean(request.getParameterMap(), User.class);
    	  //2.从Session中获取当前登录用户uid
    	  User user=(User)request.getSession().getAttribute("user");
    	  if(user==null){//说明，当前是未登录，返回登录页面，显示错误信息
    		  request.setAttribute("msg", "您还没有登录，请登录！");
    		  return "f:/jsps/user/login.jsp";
    		  
    	  }else{//3.使用uid和oldpass，newpass来调用servlet层的updatePass方法来实现修改密码功能，如果在执行过程出现异常，保存异常信息，返回pwd.jsp.
       	        //否则，保存消息，转发到msg.jsp页
    		  try{
    		     userservice.updatePass(user.getUid(), fuser.getLoginpass(), fuser.getNewloginpass());
    		     request.setAttribute("msg", "您的密码修改成功，请记住新密码");
    		     request.setAttribute("code", "success");
    		     return "f:/jsps/msg.jsp";
    		  }catch(RuntimeException e){
    	    	 request.setAttribute("msg", e.getMessage());
    		     request.setAttribute("form", fuser);
    		     return "f:/jsps/user/pwd.jsp";
    		  }
    	
    	 }
    	  
    	  
      }    
      /**
       * 退出功能
       */
      public String quit(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
    	 //使session失效
    	  request.getSession().invalidate();
    	  return "r:/jsps/user/login.jsp";
      }
      
    
}


 
