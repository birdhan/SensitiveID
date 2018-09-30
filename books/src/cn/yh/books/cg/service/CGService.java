package cn.yh.books.cg.service;

import java.sql.SQLException;
import java.util.List;

import cn.yh.books.cg.dao.CGDao;
import cn.yh.books.cg.domain.CG;

public class CGService {
   private CGDao cgdao=new CGDao();
   
   public List<CG> findALL(){
	    try {
	      return  cgdao.findALL();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	  
   }
   
}
