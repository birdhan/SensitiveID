package cn.yh.books.cg.domain;

import java.util.List;

public class CG {
	//参照分类表编写实体类
	private String cid;//主键
	private String cname;//分类名
	private String pid;//父分类id
	private String desc;//描述
	private List<CG> children;//子分类
	private CG parent;//父分类
	
	public CG getParent() {
		return parent;
	}
	public void setParent(CG parent) {
		this.parent = parent;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public List<CG> getChildren() {
		return children;
	}
	public void setChildren(List<CG> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "CG [cid=" + cid + ", cname=" + cname + ", pid=" + pid
				+ ", desc=" + desc + ", children=" + children + "]";
	}
	
	
	

}
