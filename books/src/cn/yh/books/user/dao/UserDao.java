package cn.yh.books.user.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.yh.books.user.domain.User;
import cn.yh.tools.jdbc.TxQueryRunner;

/**
 * 用户模块持久类
 * @author lsa
 *
 */
public class UserDao {
	private TxQueryRunner txqueryrunner=new TxQueryRunner();
	
	/**
	 * 校验用户名是否已被使用
	 * @param loginname
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateLoginname(String loginname) throws SQLException{
		String sql="select count(1) from t_user where loginname=?";
		Number number=(Number) txqueryrunner.query(sql, new ScalarHandler(), loginname);
		return number.intValue()==0;
	}
	/**
	 * 校验邮箱是否已被使用
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean ajaxValidateEmail(String email) throws SQLException{
		String sql="select count(1) from t_user where email=?";
		Number number=(Number) txqueryrunner.query(sql, new ScalarHandler(), email);
		return number.intValue()==0;
	}
	/**
	 * 客户注册，写数据到数据库中
	 * @param user
	 * @throws SQLException
	 */
	public void add(User user) throws SQLException{
		String sql="insert into t_user values(?,?,?,?,?,?) ";
		Object[] params={user.getUid(),user.getLoginname(),user.getLoginpass(),user.getEmail(),user.isStatus(),user.getActivationCode()};
		txqueryrunner.update(sql, params);
		
	}
	/**
	 * 查询用户
	 * @param code
	 * @return
	 * @throws SQLException
	 */
	public User FindByCode(String code) throws SQLException{
		String sql="select * from t_user where activationCode=?";
		return  txqueryrunner.query(sql, new BeanHandler<User>(User.class), code);
		
		
	}
	/**
	 * 修改状态码
	 * @param uid
	 * @param status
	 * @throws SQLException 
	 */
	public void updateStatus(String uid,Boolean status) throws SQLException {
		String sql="update t_user set status=? where uid=?";
		txqueryrunner.update(sql, status,uid);
		
	}
	/**
	 * 按照用户名和密码查询用户
	 * @param loginname
	 * @param loginpass
	 * @return
	 * @throws SQLException
	 */
	public User FindByNameAndPass(String loginname,String loginpass) throws SQLException{
		String sql="select * from t_user where loginname=? and loginpass=?";
		return txqueryrunner.query(sql, new BeanHandler<User>(User.class), loginname,loginpass);
		
	}
	
	/**
	 * 按照当前登录用户的id和修改密码时录入的原密码为条件，检验用户输入的旧密码是否正确，返回值为真，代表正确，为假，代表不正确
	 * @param uid
	 * @param loginpass
	 * @return
	 * @throws SQLException
	 */
	public boolean findByUidandPassword(String uid,String loginpass) throws SQLException{
		String sql="select count(*) from t_user where uid=? and loginpass=?";
		Number num=(Number)txqueryrunner.query(sql, new ScalarHandler(),uid,loginpass);
		return num.intValue()>0;
	}
	/**
	 * 按照当前登录用户的ID，修改他的密码
	 * @param uid
	 * @param newpass
	 * @throws SQLException
	 */
	public void updatePassword(String uid,String newpass) throws SQLException{
		String sql="update t_user set loginpass=? where uid=?";
		txqueryrunner.update(sql,newpass,uid);	
	}
	

}
