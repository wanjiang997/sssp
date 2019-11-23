package com.bonc.sssp.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Table(name="REPORT_TIME")
@Entity
public class ReportTime {
	private Integer id;
	private ReportCate1 cate1_id; // 报表大类编码
	private ReportCate2 cate2_id; // 报表小类编码
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date start_time;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date end_time;

	public ReportTime() {
		
	}

	public ReportTime(Integer id, ReportCate1 cate1_id, ReportCate2 cate2_id,
			Date start_time, Date end_time) {
		super();
		this.id = id;
		this.cate1_id = cate1_id;
		this.cate2_id = cate2_id;
		this.start_time = start_time;
		this.end_time = end_time;
	}

	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@JoinColumn(name="CATE1_ID")
	@ManyToOne(fetch=FetchType.LAZY)
	public ReportCate1 getCate1_id() {
		return cate1_id;
	}

	public void setCate1_id(ReportCate1 cate1_id) {
		this.cate1_id = cate1_id;
	}

	@JoinColumn(name="CATE2_ID")
	@ManyToOne(fetch=FetchType.LAZY)
	public ReportCate2 getCate2_id() {
		return cate2_id;
	}

	public void setCate2_id(ReportCate2 cate2_id) {
		this.cate2_id = cate2_id;
	}
	
	@Temporal(TemporalType.DATE)
	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	@Temporal(TemporalType.DATE)
	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	@Override
	public String toString() {
		return "ReportTime [id=" + id + ", cate1_id=" + cate1_id
				+ ", cate2_id=" + cate2_id + ", start_date=" + start_time
				+ ", end_date=" + end_time + "]";
	}
}
