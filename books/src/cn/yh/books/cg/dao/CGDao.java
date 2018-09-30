package cn.yh.books.cg.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.yh.books.cg.domain.CG;
import cn.yh.tools.commons.CommonUtils;
import cn.yh.tools.jdbc.TxQueryRunner;

public class CGDao {
	private TxQueryRunner tqr=new TxQueryRunner();
    /**
     * 返回所有分类
     * 依赖方法：findByParent()、toCG()、toCGList()
     * @return
     * @throws SQLException 
     */
	public List<CG> findALL() throws SQLException{
		//查询所有一级分类
		String sql="select * from t_category where pid is null";
		List<Map<String,Object>> mapList=tqr.query(sql, new MapListHandler());
		List<CG> parents=toCGList(mapList);
		//循环遍历所有一级分类，为每个一级分类加载他的二级分类
		for(CG parent:parents){
			System.out.print(parent.getPid());
			//通过父分类得到子分类对象
			List<CG> children=this.findByParent(parent.getCid());
			//设置他的父分类
			parent.setChildren(children);
		}
		return parents;	
	}	
	/**
	 * 通过父分类查询子分类
	 * @param pid
	 * @return
	 * @throws SQLException 
	 */
	public List<CG> findByParent(String pid) throws SQLException  {
		String sql = "select * from t_category where pid=? order by orderBy";
		List<Map<String,Object>> mapList = tqr.query(sql, new MapListHandler(), pid);
		
		return toCGList(mapList);
	}
	/**
	 * 把一个Map中的数据映射到一个CG中
	 * @param map
	 * @return
	 */
	private CG toCG(Map<String,Object> map){
		//得到子分类
		CG cg=CommonUtils.toBean(map, CG.class);
		String pid=(String)map.get("pid");
		if(pid!=null){
			CG parent=new CG();
			parent.setCid(pid);  
			cg.setParent(parent);
		}
		return cg;
	}
	
	/**
	 * 把多个map映射成多个CG
	 */
	private List<CG> toCGList(List<Map<String,Object>> mapList){
		List<CG> cglist=new ArrayList<CG>();//向上转型得到一个List类型的集合
		for(Map<String,Object> map:mapList){
			CG c=toCG(map);
			cglist.add(c);
		}
		return cglist;	
	}
	
	
	
}
