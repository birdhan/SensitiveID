package cn.yh.books.book.dao;

import cn.yh.books.book.domain.Book;
import cn.yh.books.cg.domain.CG;
import cn.yh.books.page.domain.PageBean;
import cn.yh.books.page.domain.PageConstants;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.jdbc.TxQueryRunner;
import cn.yh.books.page.domain.Expression;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javassist.compiler.ast.Expr;

public class BookDao {
	private TxQueryRunner tqr=new TxQueryRunner();
	
	/**
	 * 公共查询方法
	 * @param explist
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> findByCriteria(List<Expression> explist,int pc) throws SQLException{
		//1.得到ps,当前页要显示的记录数
		//得到当前页要显示的最多记录数
		int ps=PageConstants.Book_PAGE_SIZE;
		//2.通过Expression生成WHERE子句  where bname=? and cid = ?  and pid is null
		StringBuilder wheresql=new StringBuilder();
		wheresql.append(" where 1=1");
		List<Object> params=new ArrayList<Object>();
		for(Expression expr:explist){
			wheresql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
			if(!expr.getOperator().equals("is null")){
				wheresql.append("?");	
				params.add(expr.getValue());
			}	
		}
	    //3.得到要显示的总记录数tr
		String countsql="select count(*) from t_book "+wheresql;
		Number number=(Number)tqr.query(countsql,new ScalarHandler(), params.toArray());
		int tr=number.intValue();		
		//4.得到BeanList ,也就是当前页的的所有记录  ps*(pc-1)
		String sql="select * from t_book"+wheresql+" order by orderBy limit ?,?";	
		params.add((pc-1)*ps);//当前要显示的页的起始行
		params.add(ps);
		List<Book> beanList=tqr.query(sql, new BeanListHandler<Book>(Book.class), params.toArray());
		//5.创建PageBean ,得到参数，其中没有URL,直接交给Servlet处理。
		PageBean<Book> pb=new PageBean<Book>();
		pb.setBeanList(beanList);
		pb.setPc(pc);
		pb.setPs(ps);
		pb.setTr(tr);
		return pb;
	}

	/**
	 * 按分类查书籍
	 * @param cid
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
	public PageBean<Book> findByCG(String cid,int pc) throws SQLException{
		List<Expression> explist=new ArrayList<Expression>();
		explist.add(new Expression("cid","=",cid));
		return this.findByCriteria(explist, pc);
		
	}
	
	/**
	 * 按书名模糊查询
	 * @param bname
	 * @param pc
	 * @return
	 * @throws SQLException
	 */
		public PageBean<Book> findByLikeName(String bname,int pc) throws SQLException{
			List<Expression> explist=new ArrayList<Expression>();
			explist.add(new Expression("bname","like","%"+bname+"%"));
			return this.findByCriteria(explist, pc);
			
		}
		
		/**
		 * 按作者查
		 * @param bname
		 * @param pc
		 * @return
		 * @throws SQLException
		 */
		public PageBean<Book> findByAuthor(String author, int pc) throws SQLException {
			List<Expression> exprList = new ArrayList<Expression>();
			exprList.add(new Expression("author", "like", "%" + author + "%"));
			return findByCriteria(exprList, pc);
		}
		
		/**
		 * 按出版社查
		 * @param press
		 * @param pc
		 * @return
		 * @throws SQLException
		 */
		public PageBean<Book> findByPress(String press, int pc) throws SQLException {
			List<Expression> exprList = new ArrayList<Expression>();
			exprList.add(new Expression("press", "like", "%" + press + "%"));
			return findByCriteria(exprList, pc);
		}
		
		/**
		 * 多条件组合查询
		 * @param combination
		 * @param pc
		 * @return
		 * @throws SQLException
		 */
		public PageBean<Book> findByCombination(Book criteria, int pc) throws SQLException {
			List<Expression> exprList = new ArrayList<Expression>();
			exprList.add(new Expression("bname", "like", "%" + criteria.getBname() + "%"));
			exprList.add(new Expression("author", "like", "%" + criteria.getAuthor() + "%"));
			exprList.add(new Expression("press", "like", "%" + criteria.getPress() + "%"));
			return findByCriteria(exprList, pc);
		}
		
		/**
		 * 按照bid查询一个书的全部信息
		 * @param bid
		 * @return
		 * @throws SQLException 
		 */
		public Book findLoad(String bid) throws SQLException{
			String sql="select * from t_book where bid=?";
			//1.查询，得到一本书的全部信息,单行多列
			Map<String,Object> map=tqr.query(sql,new MapHandler(),bid);
			//2.把map中的值写入Book中
			Book book=CommonUtils.toBean(map, Book.class);
			//3.把map中cid映射得CG中。
			CG cg=CommonUtils.toBean(map, CG.class);
			//4.关联2个bean
			book.setCg(cg);	
			return book;
			
		}
		
		/**
		 * 按照bname查询一个书的全部信息
		 * @param bname
		 * @return
		 * @throws SQLException 
		 */
		public Book findByBname(String bname) throws SQLException{
			String sql="select * from t_book where bname=?";
			//1.查询，得到一本书的全部信息,单行多列
			Map<String,Object> map=tqr.query(sql,new MapHandler(),bname);
			//2.把map中的值写入Book中
			Book book=CommonUtils.toBean(map, Book.class);
			//3.把map中cid映射得CG中。
			CG cg=CommonUtils.toBean(map, CG.class);
			//4.关联2个bean
			book.setCg(cg);	
			return book;
			
		}
		
		
		
	
}
