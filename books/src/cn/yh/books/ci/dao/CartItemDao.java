package cn.yh.books.ci.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.yh.books.book.domain.Book;
import cn.yh.books.ci.domain.CartItem;
import cn.yh.books.user.domain.User;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.jdbc.TxQueryRunner;

public class CartItemDao {
   private TxQueryRunner tqr=new TxQueryRunner();
   
   /**
    * 通过用户查询购物车信息
    * @param uid
    * @return
    * @throws SQLException
    */
    public List<CartItem> findByUser(String uid) throws SQLException{
    	 String sql="select * from t_cartitem c,t_book b where c.bid=b.bid and uid=? order by c.orderBy";
    	 List<Map<String,Object>> maplist=tqr.query(sql, new MapListHandler(),uid);
    	 return this.toCartItemList(maplist);
    }
    
    
    /**
     * 添加购物车
     * @param ci
     * @throws SQLException
     */
    public void add(CartItem ci) throws SQLException{
     	 String sql="insert into t_cartitem(cartItemId,quantity,bid,uid) values(?,?,?,?)";
     	 Object[] params={CommonUtils.uuid(),ci.getQuantity(),ci.getBook().getBid(),ci.getUser().getUid()};
   	     tqr.update(sql, params);
   	    
   }
    /**
     * 修改数量
     * @param cartItemId
     * @param quantity
     * @throws SQLException
     */
    public void updateQuantity(String cartItemId,int quantity) throws SQLException{
    	String sql="update t_cartitem set quantity=? where cartItemId=?";
    	tqr.update(sql, quantity,cartItemId);
    }
    
    /**
     * 按ID查询购物车一条记录
     * @param cartItemId
     * @return
     * @throws SQLException
     */
    public CartItem findByCartItem(String cartItemId) throws SQLException{
    	String sql="select * from t_cartitem c,t_book b where c.bid=b.bid and c.cartItemId=?";
    	Map<String,Object> map=tqr.query(sql, new MapHandler(),cartItemId);
    	return this.toCartItem(map);
    }
    /**
     * 检索当前用户是否已经选择过这个书
     * @param uid
     * @param bid
     * @return
     * @throws SQLException
     */
    public CartItem findByUidAndBid(String uid,String bid) throws SQLException{
    	String sql="select * from t_cartitem where uid=? and bid=?";
    	Map<String,Object> map=tqr.query(sql, new MapHandler(),uid,bid);
    	CartItem ci=this.toCartItem(map);
    	return ci;
    }
   
    
    
    /**
     * 把List<Map<String,Object>>中的多个购物车信息实体，映射成List<CartItem>（多个购物车）
     * @param maplist
     * @return
     */    
   private List<CartItem> toCartItemList(List<Map<String,Object>> maplist){
	   List<CartItem> cartItemList=new ArrayList<CartItem>();
	   for(Map<String,Object> map:maplist){
		   CartItem ci=this.toCartItem(map);
		   cartItemList.add(ci);
		}
	   return cartItemList;
    	
    }
    
    /**
     * 把一个Map集合中的全部信息映射成一个CartItem对象
     * @param map
     * @return
     */
    private CartItem toCartItem(Map<String,Object> map){
    	if(map==null || map.size()==0) return null;
    	CartItem ci=CommonUtils.toBean(map, CartItem.class);
     	Book book=CommonUtils.toBean(map, Book.class);
    	User user=CommonUtils.toBean(map, User.class);
    	//体现外键关系
    	ci.setBook(book);
    	ci.setUser(user);
    	ci.setTotal();
    	
    	return ci;
    }
    /**
     * 实现删除与批量删除
     * @param cartItemIds
     * @throws SQLException
     */
    public void batchDelete(String cartItemIds) throws SQLException{
    	//1.把 cartItemIds转换成where子句，先转化成数组
    	Object[] cartItemIdsArray=cartItemIds.split(",");
    	String wheresql=this.toWheresql(cartItemIdsArray.length);
    	//2.与delete from……组合到一起，得到我的sql.
    	String sql="delete from t_cartitem where "+wheresql;
    	//3.执行
    	tqr.update(sql, cartItemIdsArray);	
    }
   
    /**
     * 合成用来实现删除和批量删除的wheresql子句
     * @param len
     * @return
     */
   private String toWheresql(int len){
	   StringBuilder sb=new StringBuilder("cartItemId in(" );
	   for(int i=0;i<len;i++){
		   sb.append("?");
		   if(i<len-1){
			   sb.append(",");
		   }	   
	   }
	   sb.append(")");
	   return sb.toString();
   }
    
   /**
    * 结算——加载多个购物车记录
    * @param cartItemIds
    * @return
 * @throws SQLException 
    */
  public List<CartItem> loadCI(String cartItemIds) throws SQLException{
	  //1.把String cartItemIds转成数组
	  Object[] cartItemArray=cartItemIds.split(",");
	  //2.合成wheresql
	  String wheresql=this.toWheresql(cartItemArray.length);
	  //3.合成最终的SQL
	  String sql="select * from t_cartitem c,t_book b where c.bid=b.bid and "+wheresql;
	  //4.执行
	  List<Map<String,Object>> maplist=tqr.query(sql, new MapListHandler(),cartItemArray);
	  return this.toCartItemList(maplist);
	  

  }
    
}
