package cn.yh.books.user.domain;
/**
 * 用户模块实体类
 * @author lsa
 *
 */
/**
 * 1.依赖数据库中的用户表结构，User对象可以封存一个用户的信息
 * 2.依赖用户模块功能中的表单，增加对确认密码和验证码的存储
 * @author lsa
 *
 */
public class User {
	private String uid;//用户编号
	private String loginname;//会员登录名
	private String loginpass;//会员密码
	private String email;//邮箱地址
	private boolean status;//是否已激活，true/false或1/0
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	private String activationCode;//激活码
	
	private String reloginpass;//确认密码
	private String verifyCode;//验证码
	
	private String newloginpass;//新密码
	  
	public String getNewloginpass() {
		return newloginpass;
	}
	public void setNewloginpass(String newloginpass) {
		this.newloginpass = newloginpass;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getLoginpass() {
		return loginpass;
	}
	public void setLoginpass(String loginpass) {
		this.loginpass = loginpass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getActivationCode() {
		return activationCode;
	}
	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}
	public String getReloginpass() {
		return reloginpass;
	}
	public void setReloginpass(String reloginpass) {
		this.reloginpass = reloginpass;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", loginname=" + loginname + ", loginpass="
				+ loginpass + ", email=" + email + ", status=" + status
				+ ", activationCode=" + activationCode + ", reloginpass="
				+ reloginpass + ", verifyCode=" + verifyCode
				+ ", newloginpass=" + newloginpass + "]";
	}
	
	
	
	

}
