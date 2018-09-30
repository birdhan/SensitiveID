package cn.yh.books.user.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import cn.yh.books.user.dao.UserDao;
import cn.yh.books.user.domain.User;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.mail.Mail;
import cn.yh.tools.mail.MailUtils;

/**
 * 用户模块业务类
 * @author lsa
 *
 */
public class UserService {
	private UserDao userdao=new UserDao();
	
	
	
	/**
	 * 检验用户名
	 * @param loginname
	 * @return
	 */
	public boolean ajaxValidateLoginname(String loginname){
		try {
			return userdao.ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			throw new RuntimeException(e);//处理异常
		}
	}
	/**
	 * 检验邮箱
	 * @param email
	 * @return
	 */
	public boolean ajaxValidateEmail(String email){
		try {
			return userdao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException(e);//处理异常
		}
	}
	/**
	 * 完成注册业务
	 * @param user
	 */
	public void regist(User user){
		//1.补齐user
		user.setUid(CommonUtils.uuid());
		user.setStatus(false);
		user.setActivationCode(CommonUtils.uuid()+CommonUtils.uuid());
		//2.向数据库添加
		try {
			userdao.add(user);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	    //3.发邮件
		Properties pro=new Properties();
		try {
			pro.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
		} catch (IOException e1) {
			throw new RuntimeException(e1);
		}
		
		//1.登录邮件服务器得到邮箱服务器对象
		String host=pro.getProperty("host");
		String name=pro.getProperty("username");
		String pass=pro.getProperty("password");
		Session session=MailUtils.createSession(host, name, pass);
		//2.创建邮件对象
		String from=pro.getProperty("from");
		String to=user.getEmail();
		String subject=pro.getProperty("subject");
		String content=MessageFormat.format(pro.getProperty("content"), user.getActivationCode());//需要用实际的激活码替换占位符,例如0
		Mail mail=new Mail(from, to, subject, content);
		//3.发邮件
		try {
			MailUtils.send(session, mail);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 激活功能
	 * @param code
	 */
	 public void activation(String code){
		 //1.通过CODE查询用户是否有这个激活码
		 try{
		 User user=userdao.FindByCode(code);
		 //2.如果user为null，说明无效激活码，跑出异常，给出异常信息。
		 if(user==null){
			 throw new UserException("无效激活码");
		 }
		 //3.修改状态码
		 userdao.updateStatus(user.getUid(), true);
		 }catch(Exception e){
			 throw new RuntimeException(e);
		 }
	 }

	 /**
	  * 自定义异常类
	  * @author lsa
	  *
	  */
	 public class UserException extends Exception{
			public UserException() {
	 			super();
	 			// TODO Auto-generated constructor stub
	 		}

	 		public UserException(String message, Throwable cause) {
	 			super(message, cause);
	 			// TODO Auto-generated constructor stub
	 		}

	 		public UserException(String message) {
	 			super(message);
	 			// TODO Auto-generated constructor stub
	 		}

	 		public UserException(Throwable cause) {
	 			super(cause);
	 			// TODO Auto-generated constructor stub
	 		}

	 		
	 		 
	 	 }

	 /**
	  * 验证登录信息
	  * @param loginname
	  * @param loginpass
	  * @return
	  */
	 public User FindByNameAndPass(User user){
		 try {
			return userdao.FindByNameAndPass(user.getLoginname(), user.getLoginpass());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	 }
	 
	 /**
	  * 修改密码
	  * @param uid
	  * @param loginpass
	  * @param newpass
	  */
	public void  updatePass(String uid,String loginpass,String newpass){
		//调用findByUidandPassword()来检验旧密码是否输入正确
		try {
			boolean b=userdao.findByUidandPassword(uid, loginpass);
			if(!b){//如果旧密码输入有误
				throw new UserException("旧密码输入错误");
			}else{//如果旧密码输入正确，则调用方法修改
				userdao.updatePassword(uid, newpass);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}catch (UserException e) {
			throw new RuntimeException(e);
		}
	}
}
