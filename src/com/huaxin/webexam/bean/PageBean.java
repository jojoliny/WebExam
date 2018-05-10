package com.huaxin.webexam.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页
 * 
 * @author Administrator
 */
public class PageBean<T> {
	public Integer pageIndex = 1;
	public Integer PageSize = 5;
	public Integer countData;
	public List<T> pageList = new ArrayList<T>();

	Integer totalIndex;

	public Integer getTotalIndex() {
		return totalIndex;
	}

	public void setTotalIndex(Integer totalIndex) {
		this.totalIndex = totalIndex;
	}

	public PageBean(Integer pageIndex, Integer pageSize, Integer countData, List<T> pageList) {
		this.pageIndex = pageIndex;
		PageSize = pageSize;
		this.countData = countData;
		this.pageList = pageList;
	}

	public PageBean() {
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getPageSize() {
		return PageSize;
	}

	public void setPageSize(Integer pageSize) {
		PageSize = pageSize;
	}

	public Integer getCountData() {
		return countData;
	}

	public void setCountData(Integer countData) {
		this.countData = countData;
	}

	public List<T> getPageList() {
		return pageList;
	}

	public void setPageList(List<T> pageList) {
		this.pageList = pageList;
	}
}
