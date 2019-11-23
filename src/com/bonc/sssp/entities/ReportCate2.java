package com.bonc.sssp.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table(name="REPORT_CATE2")
@Entity
public class ReportCate2 {
	private Integer id;
	private String name;
	private ReportCate1 cate1_id;
	private String ord;
	private String remark;

	public ReportCate2() {

	}

	public ReportCate2(Integer id) {
		this.id = id;
	}

	public ReportCate2(Integer id, String name, ReportCate1 cate1_id,
			String ord, String remark) {
		super();
		this.id = id;
		this.name = name;
		this.cate1_id = cate1_id;
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

	@JoinColumn(name="CATE1_ID")
	@ManyToOne(fetch=FetchType.LAZY)
	public ReportCate1 getCate1_id() {
		return cate1_id;
	}

	public void setCate1_id(ReportCate1 cate1_id) {
		this.cate1_id = cate1_id;
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
		return "ReportCate2 [id=" + id + ", name=" + name + ", cate1_id="
				+ cate1_id + ", ord=" + ord + ", remark=" + remark + "]";
	}
}
