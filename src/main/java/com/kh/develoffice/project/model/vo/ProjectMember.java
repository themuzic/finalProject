package com.kh.develoffice.project.model.vo;

public class ProjectMember {
	
	private int pNo;
	private int empId;
	
	public ProjectMember() {
		
	}

	public ProjectMember(int pNo, int empId) {
		super();
		this.pNo = pNo;
		this.empId = empId;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "ProjectMember [pNo=" + pNo + ", empId=" + empId + "]";
	}
	
	

}
