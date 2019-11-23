package com.bonc.sssp.entities;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Cacheable
@Table(name="REPORT_CATE1")
@Entity
public class ReportCate1 {
	private Integer id;
	private String name;
	private String ord;
	private String remark;

	public ReportCate1() {

	}
	public ReportCate1(Integer id) {
		this.id = id;
	}
	public ReportCate1(Integer id, String name, String ord, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.ord = ord;
		this.remark = remark;
	}

	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOrd() {
		return ord;
	}

	public void setOrd(String ord) {
		this.ord = ord;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "ReportCate1 [id=" + id + ", name=" + name + ", ord=" + ord
				+ ", remark=" + remark + "]";
	}
}
