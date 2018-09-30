package cn.yh.books.book.service;

import java.sql.SQLException;

import cn.yh.books.book.dao.BookDao;
import cn.yh.books.book.domain.Book;
import cn.yh.books.page.domain.PageBean;

public class BookService {
   private BookDao bookdao=new BookDao();
   
   /**
    * 按分类查
    * @param cid
    * @param pc
    * @return
    */
   public PageBean<Book> findByCG(String cid,int pc) {
	    try {
			return bookdao.findByCG(cid, pc);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
   }
   /**
    * 按书名迷糊查
    * @param bname
    * @param pc
    * @return
    */
   public PageBean<Book> findByLikeName(String bname,int pc){
	   try {
		return bookdao.findByLikeName(bname, pc);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
   }
   
   /**
    * 按作者查
    * @param author
    * @param pc
    * @return
    */
   public PageBean<Book> findByAuthor(String author, int pc){
	   try {
		return bookdao.findByAuthor(author, pc);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
   }
   /**
    * 按出版社查
    * @param press
    * @param pc
    * @return
    */
   public PageBean<Book> findByPress(String press, int pc){
	   try {
		return bookdao.findByPress(press, pc);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
   }
   
   /**
    * 按组合条件查
    * @param criteria
    * @param pc
    * @return
    */
   public PageBean<Book> findByCombination(Book criteria, int pc){
	   try {
		return bookdao.findByCombination(criteria, pc);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
	   
   }
   /**
    * 加载一本书的全部信息
    * @param bid
    * @return
    */
   public Book findLoad(String bid){
	  try {
		return  bookdao.findLoad(bid);
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
   }
   /**
    * 按书名查
    * @param bname
    * @return
    */
   public Book findByBname(String bname){
		  try {
			return  bookdao.findByBname(bname);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	   }
   
}
