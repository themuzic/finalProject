package com.kh.develoffice.teamboard.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class TeamBoardReply {
	
	private int tbrId;
	private int reftbId;
	private int tbrWriter;
	private String empName;
	private String tbrContent;
	private String tbrCreateDate;
	private String tbrModifyDate;
	private String tbrStatus;
	
}
