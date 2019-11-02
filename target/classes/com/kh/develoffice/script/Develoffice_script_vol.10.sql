﻿-----------------삭제------------------
--접속유저의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--접속유저의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--접속유저의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--접속유저의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
---------------------------------------


CREATE TABLE "EMPLOYEE" (
	"EMP_ID"		NUMBER				NOT NULL,
	"EMP_NAME"		VARCHAR2(20)		NOT NULL,
	"EMP_PWD"		VARCHAR2(2000)		NOT NULL,
	"GENDER"		VARCHAR2(1)			CHECK(GENDER IN('M','F')),
	"BIRTH"			DATE				NULL,
	"DEPT_CODE"		NUMBER				NOT NULL,
	"JOB_CODE"		NUMBER				NOT NULL,
	"PHONE"			VARCHAR2(15)		NULL,
	"EMAIL"			VARCHAR2(50)		NULL,
	"ADDRESS"		VARCHAR2(200)		NULL,
	"SALARY"		NUMBER				NULL,
	"ACCOUNT"		VARCHAR2(50)		NOT NULL,
	"STAR"			NUMBER	DEFAULT 0	NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"RETIRE_DATE"	DATE				NULL,
	"EMP_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(EMP_STATUS IN('Y','N')),
    	"PROFILE_PATH"	VARCHAR2(200)		DEFAULT 'default_profile.png'    NOT NULL,
	"STATUS_MSG"	VARCHAR2(200)	NULL
);

COMMENT ON COLUMN "EMPLOYEE"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "EMPLOYEE"."EMP_NAME" IS '이름';

COMMENT ON COLUMN "EMPLOYEE"."EMP_PWD" IS '비밀번호';

COMMENT ON COLUMN "EMPLOYEE"."GENDER" IS '성별';

COMMENT ON COLUMN "EMPLOYEE"."BIRTH" IS '생년월일';

COMMENT ON COLUMN "EMPLOYEE"."DEPT_CODE" IS '부서코드FK';

COMMENT ON COLUMN "EMPLOYEE"."JOB_CODE" IS '직급코드FK';

COMMENT ON COLUMN "EMPLOYEE"."PHONE" IS '휴대폰번호';

COMMENT ON COLUMN "EMPLOYEE"."EMAIL" IS '이메일';

COMMENT ON COLUMN "EMPLOYEE"."ADDRESS" IS '주소';

COMMENT ON COLUMN "EMPLOYEE"."SALARY" IS '기본급';

COMMENT ON COLUMN "EMPLOYEE"."ACCOUNT" IS '급여계좌번호';

COMMENT ON COLUMN "EMPLOYEE"."STAR" IS '별갯수';

COMMENT ON COLUMN "EMPLOYEE"."ENROLL_DATE" IS '입사날짜';

COMMENT ON COLUMN "EMPLOYEE"."RETIRE_DATE" IS '퇴사날짜';

COMMENT ON COLUMN "EMPLOYEE"."EMP_STATUS" IS '상태(Y/N)';

COMMENT ON COLUMN "EMPLOYEE"."PROFILE_PATH" IS '프로필사진경로';

COMMENT ON COLUMN "EMPLOYEE"."STATUS_MSG" IS '상태메세지';

----------------------------------------------------------

CREATE TABLE "DEPARTMENT" (
	"DEPT_CODE"	NUMBER			NOT NULL,
	"DEPT_NAME"	VARCHAR2(30)	NULL
);

COMMENT ON COLUMN "DEPARTMENT"."DEPT_CODE" IS '부서코드';

COMMENT ON COLUMN "DEPARTMENT"."DEPT_NAME" IS '부서명';

----------------------------------------------------------

CREATE TABLE "JOB" (
	"JOB_CODE"	NUMBER			NOT NULL,
	"JOB_NAME"	VARCHAR2(20)	NULL
);

COMMENT ON COLUMN "JOB"."JOB_CODE" IS '직급코드';

COMMENT ON COLUMN "JOB"."JOB_NAME" IS '직급명';

----------------------------------------------------------

CREATE TABLE "RESERVATION" (
	"RESERV_NUM"	VARCHAR2(30)	NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"RESERV_TYPE"	VARCHAR2(1)		NOT NULL,
	"START_DATE"	DATE			NOT NULL,
	"END_DATE"		DATE			NOT NULL
);

COMMENT ON COLUMN "RESERVATION"."RESERV_NUM" IS '예약번호PK';

COMMENT ON COLUMN "RESERVATION"."EMP_ID" IS '예약한직원FK';

COMMENT ON COLUMN "RESERVATION"."RESERV_TYPE" IS '예약한것종류';

COMMENT ON COLUMN "RESERVATION"."START_DATE" IS '예약시작날짜시간';

COMMENT ON COLUMN "RESERVATION"."END_DATE" IS '예약종료날짜시간';

----------------------------------------------------------

CREATE TABLE "PAYMENT" (
	"PAY_NUM"	VARCHAR2(300)		NOT NULL,
	"EMP_ID"	NUMBER				NOT NULL,
	"PRICE"		NUMBER				NOT NULL,
	"PRODUCT"	VARCHAR2(1000)		NOT NULL,
    "QUANTITY"	NUMBER		        NOT NULL,
	"PAY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PAYMENT"."PAY_NUM" IS '결제번호PK';

COMMENT ON COLUMN "PAYMENT"."EMP_ID" IS '결제한직원FK';

COMMENT ON COLUMN "PAYMENT"."PRICE" IS '결제가격';

COMMENT ON COLUMN "PAYMENT"."PRODUCT" IS '결제한상품';

COMMENT ON COLUMN "PAYMENT"."QUANTITY" IS '결제한수량';

COMMENT ON COLUMN "PAYMENT"."PAY_DATE" IS '결제날짜';

----------------------------------------------------------

CREATE TABLE "PROJECT" (
	"P_NO"			NUMBER				NOT NULL,
	"P_NAME"		VARCHAR2(100)		NOT NULL,
	"P_CONTENT"		VARCHAR2(200)		NULL,
	"PM_ID"			NUMBER				NOT NULL,
	"P_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"P_PROGRESS"	NUMBER				NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "PROJECT"."P_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT"."P_NAME" IS '프로젝트 이름';

COMMENT ON COLUMN "PROJECT"."P_CONTENT" IS '플젝 상세 설명';

COMMENT ON COLUMN "PROJECT"."PM_ID" IS '팀장IDPK';

COMMENT ON COLUMN "PROJECT"."P_ENROLL_DATE" IS '플젝 등록날짜';

COMMENT ON COLUMN "PROJECT"."P_PROGRESS" IS '플젝 진행률';

COMMENT ON COLUMN "PROJECT"."STATUS" IS '플젝상태';

----------------------------------------------------------

CREATE TABLE "TODO" (
	"TODO_NO"			NUMBER				NOT NULL,
	"TD_BOARD_NO"		NUMBER				NOT NULL,
	"EMP_ID"			NUMBER				NOT NULL,
	"TODO_NAME"			VARCHAR2(50)		NOT NULL,
	"TODO_CONTENT"		VARCHAR2(200)		NULL,
	"TODO_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"TODO_STATUS"		VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "TODO"."TODO_NO" IS '업무 번호';

COMMENT ON COLUMN "TODO"."TD_BOARD_NO" IS '보드 번호FK';

COMMENT ON COLUMN "TODO"."EMP_ID" IS '사번FK';

COMMENT ON COLUMN "TODO"."TODO_NAME" IS '업무 제목';

COMMENT ON COLUMN "TODO"."TODO_CONTENT" IS '업무 상세 내용';

COMMENT ON COLUMN "TODO"."TODO_ENROLL_DATE" IS '업무 등록 날짜';

COMMENT ON COLUMN "TODO"."TODO_STATUS" IS '업무 상태(대기, 진행, 완료,삭제)';

----------------------------------------------------------

CREATE TABLE "NOTICE" (
	"NOTICE_NO"			NUMBER			NOT NULL,
	"EMP_ID"			NUMBER			NOT NULL,
	"NOTICE_TITLE"		VARCHAR2(100)	NOT NULL,
	"NOTICE_CONTENT"	CLOB			NOT NULL,
	"NOTICE_WRITER"		VARCHAR2(30)	NOT NULL,
	"NOTICE_COUNT"		NUMBER			NULL,
	"NOTICE_DATE"		DATE			NOT NULL,
	"NOTICE_MODIFY"		DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"			VARCHAR2(2)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '글번호';

COMMENT ON COLUMN "NOTICE"."EMP_ID" IS '사원번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '글제목';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '글내용';

COMMENT ON COLUMN "NOTICE"."NOTICE_WRITER" IS '작성자';

COMMENT ON COLUMN "NOTICE"."NOTICE_COUNT" IS '조회수';

COMMENT ON COLUMN "NOTICE"."NOTICE_DATE" IS '게시일자';

COMMENT ON COLUMN "NOTICE"."NOTICE_MODIFY" IS '수정일';

COMMENT ON COLUMN "NOTICE"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "FREE_REPLY" (
	"FREE_RID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"REF_FID"		NUMBER			NOT NULL,
	"FREE_RWRITER"	NUMBER			NOT NULL,
	"FREE_RCONTENT"	VARCHAR2(400)	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "FREE_REPLY"."FREE_RID" IS '댓글번호';

COMMENT ON COLUMN "FREE_REPLY"."EMP_ID" IS '사원번호';

COMMENT ON COLUMN "FREE_REPLY"."REF_FID" IS '글번호';

COMMENT ON COLUMN "FREE_REPLY"."FREE_RWRITER" IS '작성자';

COMMENT ON COLUMN "FREE_REPLY"."FREE_RCONTENT" IS '내용';

COMMENT ON COLUMN "FREE_REPLY"."CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "FREE_REPLY"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "FREE_REPLY"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "DOCUMENT" (
	"DOCU_NUM"	NUMBER			NOT NULL,
	"DOCU_TYPE"	VARCHAR2(2)		CHECK(DOCU_TYPE IN('AP','CN','CF')),
	"DOCU_CODE"	NUMBER			NOT NULL,
	"EMP_ID"	NUMBER			NOT NULL,
	"SAVE_TERM"	NUMBER			NOT NULL,
	"SECURITY"	VARCHAR2(1)		NOT NULL,
	"DOCU_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "DOCUMENT"."DOCU_NUM" IS '통합문서PK';

COMMENT ON COLUMN "DOCUMENT"."DOCU_TYPE" IS '문서종류';

COMMENT ON COLUMN "DOCUMENT"."DOCU_CODE" IS '문서번호';

COMMENT ON COLUMN "DOCUMENT"."EMP_ID" IS '작성한직원IDFK';

COMMENT ON COLUMN "DOCUMENT"."SAVE_TERM" IS '보존연한';

COMMENT ON COLUMN "DOCUMENT"."SECURITY" IS '보안등급';

COMMENT ON COLUMN "DOCUMENT"."DOCU_DATE" IS '작성한날짜';

COMMENT ON COLUMN "DOCUMENT"."STATUS" IS '활성화상태';

----------------------------------------------------------

CREATE TABLE "APPROVAL" (
	"DOCU_NUM"			NUMBER		NOT NULL,
	"EMP_ID"			NUMBER		NOT NULL,
	"STATUS"			VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y','N')),
	"APPROVAL_DATE"		DATE		NULL
);

COMMENT ON COLUMN "APPROVAL"."DOCU_NUM" IS '통합문서FKPK';

COMMENT ON COLUMN "APPROVAL"."EMP_ID" IS '결재선에포함된직원FKPK';

COMMENT ON COLUMN "APPROVAL"."STATUS" IS '결재상태(Y/N)';

COMMENT ON COLUMN "APPROVAL"."APPROVAL_DATE" IS '결재한날짜';

----------------------------------------------------------

CREATE TABLE "REFERENCE" (
	"DOCU_NUM"		NUMBER		NOT NULL,
	"EMP_ID"		NUMBER		NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y','N')),
	"CHECK_DATE"	DATE		NULL
);

COMMENT ON COLUMN "REFERENCE"."DOCU_NUM" IS '통합문서번호FKPK';

COMMENT ON COLUMN "REFERENCE"."EMP_ID" IS '참조인에포함된직원FKPK';

COMMENT ON COLUMN "REFERENCE"."STATUS" IS '확인상태(Y/N)';

COMMENT ON COLUMN "REFERENCE"."CHECK_DATE" IS '확인한날짜';

----------------------------------------------------------

CREATE TABLE "DOCUA" (
	"DOCU_NUM"			NUMBER			NOT NULL,
	"TITLE"				VARCHAR2(200)	NOT NULL,
	"ACCOUNTING_TYPE"	VARCHAR2(1)		NOT NULL,
	"SPENDING_YEAR"		NUMBER			NOT NULL,
	"SPENDING_MONTH"	NUMBER			NOT NULL,
	"SPENDER_NAME"		VARCHAR2(20)	NULL,
	"ACCOUNT_NAME"		VARCHAR2(100)	NOT NULL,
	"EXPENSE_DATE"		VARCHAR2(8)		NOT NULL,
	"DEPARTMENT_NAME"	VARCHAR2(50)	NOT NULL,
	"PRICE"				NUMBER			NOT NULL,
	"CUSTOMER"			VARCHAR2(50)	NOT NULL,
	"BRIEF"				VARCHAR2(100)	NOT NULL,
	"STATUS"			VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "DOCUA"."DOCU_NUM" IS '통합문서PKFK';

COMMENT ON COLUMN "DOCUA"."TITLE" IS '문서제목';

COMMENT ON COLUMN "DOCUA"."ACCOUNTING_TYPE" IS '결제타입(개인/법인)';

COMMENT ON COLUMN "DOCUA"."SPENDING_YEAR" IS '회계기준년도';

COMMENT ON COLUMN "DOCUA"."SPENDING_MONTH" IS '회계기준월';

COMMENT ON COLUMN "DOCUA"."SPENDER_NAME" IS '지출자이름';

COMMENT ON COLUMN "DOCUA"."ACCOUNT_NAME" IS '계정과목(지출내용)';

COMMENT ON COLUMN "DOCUA"."EXPENSE_DATE" IS '지출일자';

COMMENT ON COLUMN "DOCUA"."DEPARTMENT_NAME" IS '코스트센터(지출부서)';

COMMENT ON COLUMN "DOCUA"."PRICE" IS '금액';

COMMENT ON COLUMN "DOCUA"."CUSTOMER" IS '거래처';

COMMENT ON COLUMN "DOCUA"."BRIEF" IS '적요(사유)';

COMMENT ON COLUMN "DOCUA"."STATUS" IS '활성화상태';

----------------------------------------------------------

CREATE TABLE "DOCUB" (
	"DOCU_NUM"	NUMBER			NOT NULL,
	"TITLE"		VARCHAR2(200)	NOT NULL,
	"CONTENT"	CLOB			NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "DOCUB"."DOCU_NUM" IS '통합문서PKFK';

COMMENT ON COLUMN "DOCUB"."TITLE" IS '문서제목';

COMMENT ON COLUMN "DOCUB"."CONTENT" IS '문서내용';

COMMENT ON COLUMN "DOCUB"."STATUS" IS '활성화상태';

----------------------------------------------------------

CREATE TABLE "CHAT" (
	"CHAT_ID"		NUMBER		NOT NULL,
	"CREATE_DATE"	DATE		DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE		NOT NULL,
	"CHAT_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(CHAT_STATUS IN('Y','N')),
	"CHAT_TYPE"		NUMBER		NOT NULL
);

COMMENT ON COLUMN "CHAT"."CHAT_ID" IS '채팅방번호';

COMMENT ON COLUMN "CHAT"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "CHAT"."MODIFY_DATE" IS '갱신일자';

COMMENT ON COLUMN "CHAT"."CHAT_STATUS" IS '상태';

COMMENT ON COLUMN "CHAT"."CHAT_TYPE" IS '단톡,갠톡타입';

----------------------------------------------------------

CREATE TABLE "MESSAGE" (
	"MSG_ID"		NUMBER			NOT NULL,
	"CHAT_ID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"M_CONTENT"		VARCHAR2(300)	NOT NULL,
	"M_CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"M_STATUS"		VARCHAR2(2)	DEFAULT 'Y'	CHECK(M_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "MESSAGE"."MSG_ID" IS '메세지번호';

COMMENT ON COLUMN "MESSAGE"."CHAT_ID" IS '채팅방번호';

COMMENT ON COLUMN "MESSAGE"."EMP_ID" IS '사번';

COMMENT ON COLUMN "MESSAGE"."M_CONTENT" IS '메세지내용';

COMMENT ON COLUMN "MESSAGE"."M_CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "MESSAGE"."M_STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "FREE" (
	"FREE_NO"			NUMBER			NOT NULL,
	"EMP_ID"			NUMBER			NOT NULL,
	"FREE_TITLE"		VARCHAR2(100)	NOT NULL,
	"FREE_CONTENT"		CLOB			NOT NULL,
	"FREE_WRITER"		VARCHAR2(30)	NOT NULL,
	"FREE_COUNT"		NUMBER			NULL,
	"FREE_CREATE"		DATE	DEFAULT SYSDATE	NOT NULL,
	"FREE_MODIFY"		DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"			VARCHAR2(2)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N')),
	"FREE_LIKE_COUNT"	NUMBER			NULL
);

COMMENT ON COLUMN "FREE"."FREE_NO" IS '글번호';

COMMENT ON COLUMN "FREE"."EMP_ID" IS '사원번호';

COMMENT ON COLUMN "FREE"."FREE_TITLE" IS '글제목';

COMMENT ON COLUMN "FREE"."FREE_CONTENT" IS '글내용';

COMMENT ON COLUMN "FREE"."FREE_WRITER" IS '작성자';

COMMENT ON COLUMN "FREE"."FREE_COUNT" IS '조회수';

COMMENT ON COLUMN "FREE"."FREE_CREATE" IS '게시일';

COMMENT ON COLUMN "FREE"."FREE_MODIFY" IS '수정일';

COMMENT ON COLUMN "FREE"."STATUS" IS '상태';

COMMENT ON COLUMN "FREE"."FREE_LIKE_COUNT" IS '좋아요';

----------------------------------------------------------

CREATE TABLE "TEAM_BOARD" (
	"TEAM_BOARD_NO"	NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"TEAM_TITLE"	VARCHAR2(100)	NOT NULL,
	"TEAM_CONTENT"	CLOB			NOT NULL,
	"TEAM_WRITER"	VARCHAR2(30)	NOT NULL,
	"TEAM_COUNT"	NUMBER			NULL,
	"TEAM_CREATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"TEAM_MODIFY"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(2)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_BOARD_NO" IS '글번호';

COMMENT ON COLUMN "TEAM_BOARD"."EMP_ID" IS '사원번호';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_TITLE" IS '글제목';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_CONTENT" IS '글내용';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_WRITER" IS '작성자';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_COUNT" IS '조회수';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_CREATE" IS '게시일';

COMMENT ON COLUMN "TEAM_BOARD"."TEAM_MODIFY" IS '수정일';

COMMENT ON COLUMN "TEAM_BOARD"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "FREE_LIKE" (
	"EMP_ID"	NUMBER		NOT NULL,
	"FREE_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FREE_LIKE"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "FREE_LIKE"."FREE_NO" IS '글번호';

----------------------------------------------------------

CREATE TABLE "TEAM_BOARD_REPLY" (
	"TEAM_RID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"REF_TID"		NUMBER			NOT NULL,
	"TEAM_RWRITER"	NUMBER			NOT NULL,
	"TEAM_RCONTENT"	VARCHAR2(400)	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."TEAM_RID" IS '댓글번호';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."EMP_ID" IS '사원번호';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."REF_TID" IS '글번호';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."TEAM_RWRITER" IS '작성자';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."TEAM_RCONTENT" IS '내용';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "TEAM_BOARD_REPLY"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "TODO_BOARD" (
	"TD_BOARD_NO"			NUMBER			NOT NULL,
	"TD_BOARD_NAME"			VARCHAR2(50)	NOT NULL,
	"EMP_ID"				NUMBER			NOT NULL,
	"TD_BOARD_CONTENT"		VARCHAR2(100)	NULL,
	"TD_BOARD_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"TD_BOARD_MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"TD_BOARD_STATUS"		VARCHAR2(2)	DEFAULT 'Y'	CHECK(TD_BOARD_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_NO" IS '보드 번호';

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_NAME" IS '보드 이름';

COMMENT ON COLUMN "TODO_BOARD"."EMP_ID" IS '사번FK';

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_CONTENT" IS '보드 상세 내용';

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_ENROLL_DATE" IS '보드 생성 날짜';

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_MODIFY_DATE" IS '보드 수정 날짜';

COMMENT ON COLUMN "TODO_BOARD"."TD_BOARD_STATUS" IS '보드 status';

----------------------------------------------------------

CREATE TABLE "MAIL" (
	"MAIL_NUM"			NUMBER			NOT NULL,
	"EMP_ID"			NUMBER			NOT NULL,
	"MAIL_FROM"			VARCHAR2(30)	NOT NULL,
	"MAIL_TO"			VARCHAR2(30)	NOT NULL,
	"MAIL_TITLE"		VARCHAR2(100)	NULL,
	"MAIL_CONTENT"		VARCHAR2(1000)	NULL,
	"MAIL_DATE"			DATE	DEFAULT SYSDATE	NOT NULL,
	"MAIL_TYPE"			NUMBER	DEFAULT 0	NOT NULL,
	"MAIL_IMPORTMENT"	NUMBER			NOT NULL,
    "MAIL_STATUS"       VARCHAR2(1)	DEFAULT 'Y'	CHECK(MAIL_STATUS IN('Y','N'))
);

COMMENT ON COLUMN "MAIL"."MAIL_NUM" IS '메일번호';

COMMENT ON COLUMN "MAIL"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "MAIL"."MAIL_FROM" IS '수신자';

COMMENT ON COLUMN "MAIL"."MAIL_TO" IS '발신자';

COMMENT ON COLUMN "MAIL"."MAIL_TITLE" IS '제목';

COMMENT ON COLUMN "MAIL"."MAIL_CONTENT" IS '내용';

COMMENT ON COLUMN "MAIL"."MAIL_DATE" IS '작성일';

COMMENT ON COLUMN "MAIL"."MAIL_TYPE" IS '메일함';

COMMENT ON COLUMN "MAIL"."MAIL_IMPORTMENT" IS '중요메일';

COMMENT ON COLUMN "MAIL"."MAIL_STATUS" IS '메일상태';

----------------------------------------------------------

CREATE TABLE "SCHEDULE" (
	"SNO"			NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"SCHEDULE"		VARCHAR2(100)	NOT NULL,
	"STARTDATE"		VARCHAR2(20)	NOT NULL,
	"ENDDATE"		VARCHAR2(20)	NOT NULL,
	"ALLDAY"		CHAR(1)			CHECK(ALLDAY IN('Y','N')),
	"BACKCOLOR"		VARCHAR2(20)	NOT NULL,
	"CREATETIME"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFYTIME"	DATE	DEFAULT SYSDATE	NULL,
	"SCHE_TYPE"		VARCHAR2(1)		CHECK(SCHE_TYPE IN('C','P'))
);

COMMENT ON COLUMN "SCHEDULE"."SNO" IS '일정번호';

COMMENT ON COLUMN "SCHEDULE"."EMP_ID" IS '사번FK';

COMMENT ON COLUMN "SCHEDULE"."SCHEDULE" IS '일정명';

COMMENT ON COLUMN "SCHEDULE"."STARTDATE" IS '시작시간';

COMMENT ON COLUMN "SCHEDULE"."ENDDATE" IS '종료시간';

COMMENT ON COLUMN "SCHEDULE"."ALLDAY" IS '종일(Y/N)';

COMMENT ON COLUMN "SCHEDULE"."BACKCOLOR" IS '식별색';

COMMENT ON COLUMN "SCHEDULE"."CREATETIME" IS '등록시간';

COMMENT ON COLUMN "SCHEDULE"."MODIFYTIME" IS '수정시간';

COMMENT ON COLUMN "SCHEDULE"."SCHE_TYPE" IS '개인/회사';

----------------------------------------------------------

CREATE TABLE "PROJECT_REPLY" (
	"P_RID"			NUMBER			NOT NULL,
	"P_NO"			NUMBER			NOT NULL,
	"P_RWRITER"		NUMBER			NOT NULL,
	"P_RCONTENT"	VARCHAR2(500)	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "PROJECT_REPLY"."P_RID" IS '프로젝트게시판 댓글 번호';

COMMENT ON COLUMN "PROJECT_REPLY"."P_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT_REPLY"."P_RWRITER" IS '댓글 작성자';

COMMENT ON COLUMN "PROJECT_REPLY"."P_RCONTENT" IS '댓글 내용';

COMMENT ON COLUMN "PROJECT_REPLY"."CREATE_DATE" IS '작성일';

COMMENT ON COLUMN "PROJECT_REPLY"."MODIFY_DATE" IS '수정일';

COMMENT ON COLUMN "PROJECT_REPLY"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "JOIN_CHAT" (
	"CHAT_ID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"JOIN_DATE"		DATE	DEFAULT SYSDATE	NOT NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "JOIN_CHAT"."CHAT_ID" IS '채팅방번호';

COMMENT ON COLUMN "JOIN_CHAT"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "JOIN_CHAT"."JOIN_DATE" IS '초대일자';

COMMENT ON COLUMN "JOIN_CHAT"."MODIFY_DATE" IS '갱신일자';

----------------------------------------------------------

CREATE TABLE "PROJECT_MEMBER" (
	"P_NO"		NUMBER		NOT NULL,
	"EMP_ID"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PROJECT_MEMBER"."P_NO" IS '프로젝트 번호';

COMMENT ON COLUMN "PROJECT_MEMBER"."EMP_ID" IS '사번PK';

----------------------------------------------------------

CREATE TABLE "WORKTIME" (
	"TODAY"		VARCHAR2(8)		NOT NULL,
	"EMP_ID"	NUMBER			NOT NULL,
	"CHECKIN"	DATE	DEFAULT SYSDATE	NOT NULL,
	"CHECKOUT"	DATE			NULL
);

COMMENT ON COLUMN "WORKTIME"."TODAY" IS '오늘날짜';

COMMENT ON COLUMN "WORKTIME"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "WORKTIME"."CHECKIN" IS '출근시간';

COMMENT ON COLUMN "WORKTIME"."CHECKOUT" IS '퇴근시간';

----------------------------------------------------------

CREATE TABLE "HELP" (
	"WORK_ID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"WORK_TITLE"	VARCHAR2(100)	NOT NULL,
	"WORK_CONTENT"	VARCHAR2(1000)	NULL,
	"REGIST_DATE"	DATE			DEFAULT SYSDATE	NOT NULL,
	"HELPER_ID"		NUMBER			NULL,
	"STATUS"		VARCHAR2(1)		DEFAULT 'N' CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "HELP"."WORK_ID" IS '일감번호PK';

COMMENT ON COLUMN "HELP"."EMP_ID" IS '일감등록한직원FK';

COMMENT ON COLUMN "HELP"."WORK_TITLE" IS '일감제목';

COMMENT ON COLUMN "HELP"."WORK_CONTENT" IS '일감내용';

COMMENT ON COLUMN "HELP"."REGIST_DATE" IS '일감등록한날짜시간';

COMMENT ON COLUMN "HELP"."HELPER_ID" IS '대리업무할직원FK';

COMMENT ON COLUMN "HELP"."STATUS" IS '대리업무완료상태';

----------------------------------------------------------

CREATE TABLE "CHAT_FILE" (
	"FID"			NUMBER			NOT NULL,
	"CHAT_ID"		NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"FILE_PATH"		VARCHAR2(1000)	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(1000)	NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(2)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N')),
	"VALIDITY"		DATE			NOT NULL
);

COMMENT ON COLUMN "CHAT_FILE"."FID" IS '파일번호';

COMMENT ON COLUMN "CHAT_FILE"."CHAT_ID" IS '채팅방번호';

COMMENT ON COLUMN "CHAT_FILE"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "CHAT_FILE"."FILE_PATH" IS '사진경로';

COMMENT ON COLUMN "CHAT_FILE"."ORIGIN_NAME" IS '원본명';

COMMENT ON COLUMN "CHAT_FILE"."CHANGE_NAME" IS '수정명';

COMMENT ON COLUMN "CHAT_FILE"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "CHAT_FILE"."STATUS" IS '상태';

COMMENT ON COLUMN "CHAT_FILE"."VALIDITY" IS '유효기간';

----------------------------------------------------------

CREATE TABLE "PROJECT_FILE" (
	"P_FID"			NUMBER			NOT NULL,
	"P_NO"			NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"FILE_PATH"		VARCHAR2(1000)	NULL,
	"ORGIN_NAME"	VARCHAR2(1000)	NULL,
	"CHANGE_NAME"	VARCHAR2(1000)	NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(2)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "PROJECT_FILE"."P_FID" IS '파일번호';

COMMENT ON COLUMN "PROJECT_FILE"."P_NO" IS '프로젝트 번호FK';

COMMENT ON COLUMN "PROJECT_FILE"."EMP_ID" IS '사번FK';

COMMENT ON COLUMN "PROJECT_FILE"."FILE_PATH" IS '사진경로';

COMMENT ON COLUMN "PROJECT_FILE"."ORGIN_NAME" IS '원본명';

COMMENT ON COLUMN "PROJECT_FILE"."CHANGE_NAME" IS '수정명';

COMMENT ON COLUMN "PROJECT_FILE"."CREATE_DATE" IS '등록날짜';

COMMENT ON COLUMN "PROJECT_FILE"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "MAILFILE" (
	"M_FID"			NUMBER			NOT NULL,
	"M_FILE_PATH"	VARCHAR2(1000)	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(1000)	NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N')),
	"EMP_ID"		NUMBER			NOT NULL
);

COMMENT ON COLUMN "MAILFILE"."M_FID" IS '파일번호';

COMMENT ON COLUMN "MAILFILE"."M_FILE_PATH" IS '사진경로';

COMMENT ON COLUMN "MAILFILE"."ORIGIN_NAME" IS '원본명';

COMMENT ON COLUMN "MAILFILE"."CHANGE_NAME" IS '수정명';

COMMENT ON COLUMN "MAILFILE"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "MAILFILE"."STATUS" IS '상태';

COMMENT ON COLUMN "MAILFILE"."EMP_ID" IS '사번PK';

----------------------------------------------------------

CREATE TABLE "DOCUMENT_FILE" (
	"FILE_NO"		NUMBER			NOT NULL,
	"DOCU_NUM"		NUMBER			NOT NULL,
	"FILE_PATH"		VARCHAR2(1000)	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(1000)	NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "DOCUMENT_FILE"."FILE_NO" IS '파일번호';

COMMENT ON COLUMN "DOCUMENT_FILE"."DOCU_NUM" IS '통합문서PK';

COMMENT ON COLUMN "DOCUMENT_FILE"."FILE_PATH" IS '사진경로';

COMMENT ON COLUMN "DOCUMENT_FILE"."ORIGIN_NAME" IS '원본명';

COMMENT ON COLUMN "DOCUMENT_FILE"."CHANGE_NAME" IS '수정명';

COMMENT ON COLUMN "DOCUMENT_FILE"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "DOCUMENT_FILE"."STATUS" IS '상태';

----------------------------------------------------------

CREATE TABLE "BOARD_FILE" (
	"B_FID"			NUMBER			NOT NULL,
	"EMP_ID"		NUMBER			NOT NULL,
	"B_FILE_PATH"	VARCHAR2(1000)	NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(1000)	NOT NULL,
	"CHANGE_NAME"	VARCHAR2(1000)	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"STATUS"		VARCHAR2(1)	DEFAULT 'Y'	CHECK(STATUS IN('Y','N')),
	"B_TYPE"		NUMBER			NOT NULL
);

COMMENT ON COLUMN "BOARD_FILE"."B_FID" IS '파일번호';

COMMENT ON COLUMN "BOARD_FILE"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "BOARD_FILE"."B_FILE_PATH" IS '사진경로';

COMMENT ON COLUMN "BOARD_FILE"."ORIGIN_NAME" IS '원본명';

COMMENT ON COLUMN "BOARD_FILE"."CHANGE_NAME" IS '수정명';

COMMENT ON COLUMN "BOARD_FILE"."CREATE_DATE" IS '생성일자';

COMMENT ON COLUMN "BOARD_FILE"."STATUS" IS '상태';

COMMENT ON COLUMN "BOARD_FILE"."B_TYPE" IS '게시판 타입';

----------------------------------------------------------

CREATE TABLE "WIDGET" (
	"WIDGET_TYPE"	NUMBER		NOT NULL,
	"EMP_ID"		NUMBER		NOT NULL,
	"LEFT"			NUMBER		NULL,
	"TOP"			NUMBER		NULL,
	"FOLD"			VARCHAR2(1)	DEFAULT 'N'	CHECK(FOLD IN('Y','N')),
	"STATUS"		VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "WIDGET"."WIDGET_TYPE" IS 'PK';

COMMENT ON COLUMN "WIDGET"."EMP_ID" IS '사번PK';

COMMENT ON COLUMN "WIDGET"."LEFT" IS 'LEFT좌표';

COMMENT ON COLUMN "WIDGET"."TOP" IS 'TOP좌표';

COMMENT ON COLUMN "WIDGET"."FOLD" IS '접힌상태';

COMMENT ON COLUMN "WIDGET"."STATUS" IS '활성화상태';

----------------------------------------------------------

---------------------- PK ----------------------------------

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY ("EMP_ID");

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY ("DEPT_CODE");

ALTER TABLE "JOB" ADD CONSTRAINT "PK_JOB" PRIMARY KEY ("JOB_CODE");

ALTER TABLE "RESERVATION" ADD CONSTRAINT "PK_RESERVATION" PRIMARY KEY ("RESERV_NUM");

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("PAY_NUM");

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY ("P_NO");

ALTER TABLE "TODO" ADD CONSTRAINT "PK_TODO" PRIMARY KEY ("TODO_NO");

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NOTICE_NO");

ALTER TABLE "FREE_REPLY" ADD CONSTRAINT "PK_FREE_REPLY" PRIMARY KEY ("FREE_RID");

ALTER TABLE "DOCUMENT" ADD CONSTRAINT "PK_DOCUMENT" PRIMARY KEY ("DOCU_NUM");

ALTER TABLE "APPROVAL" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY ("DOCU_NUM","EMP_ID");

ALTER TABLE "REFERENCE" ADD CONSTRAINT "PK_REFERENCE" PRIMARY KEY ("DOCU_NUM","EMP_ID");

ALTER TABLE "DOCUA" ADD CONSTRAINT "PK_DOCUA" PRIMARY KEY ("DOCU_NUM");

ALTER TABLE "DOCUB" ADD CONSTRAINT "PK_DOCUB" PRIMARY KEY ("DOCU_NUM");

ALTER TABLE "CHAT" ADD CONSTRAINT "PK_CHAT" PRIMARY KEY ("CHAT_ID");

ALTER TABLE "MESSAGE" ADD CONSTRAINT "PK_MESSAGE" PRIMARY KEY ("MSG_ID");

ALTER TABLE "FREE" ADD CONSTRAINT "PK_FREE" PRIMARY KEY ("FREE_NO");

ALTER TABLE "TEAM_BOARD" ADD CONSTRAINT "PK_TEAM_BOARD" PRIMARY KEY ("TEAM_BOARD_NO");

ALTER TABLE "FREE_LIKE" ADD CONSTRAINT "PK_FREE_LIKE" PRIMARY KEY ("EMP_ID","FREE_NO");

ALTER TABLE "TEAM_BOARD_REPLY" ADD CONSTRAINT "PK_TEAM_BOARD_REPLY" PRIMARY KEY ("TEAM_RID");

ALTER TABLE "TODO_BOARD" ADD CONSTRAINT "PK_TODO_BOARD" PRIMARY KEY ("TD_BOARD_NO");

ALTER TABLE "MAIL" ADD CONSTRAINT "PK_MAIL" PRIMARY KEY ("MAIL_NUM");

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY ("SNO");

ALTER TABLE "PROJECT_REPLY" ADD CONSTRAINT "PK_PROJECT_REPLY" PRIMARY KEY ("P_RID");

ALTER TABLE "JOIN_CHAT" ADD CONSTRAINT "PK_JOIN_CHAT" PRIMARY KEY ("CHAT_ID","EMP_ID");

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "PK_PROJECT_MEMBER" PRIMARY KEY ("P_NO","EMP_ID");

ALTER TABLE "WORKTIME" ADD CONSTRAINT "PK_WORKTIME" PRIMARY KEY ("TODAY","EMP_ID");

ALTER TABLE "HELP" ADD CONSTRAINT "PK_HELP" PRIMARY KEY ("WORK_ID");

ALTER TABLE "CHAT_FILE" ADD CONSTRAINT "PK_CHAT_FILE" PRIMARY KEY ("FID");

ALTER TABLE "PROJECT_FILE" ADD CONSTRAINT "PK_PROJECT_FILE" PRIMARY KEY ("P_FID");

ALTER TABLE "MAILFILE" ADD CONSTRAINT "PK_MAILFILE" PRIMARY KEY ("M_FID");

ALTER TABLE "DOCUMENT_FILE" ADD CONSTRAINT "PK_DOCUMENT_FILE" PRIMARY KEY ("FILE_NO");

ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "PK_BOARD_FILE" PRIMARY KEY ("B_FID");

ALTER TABLE "WIDGET" ADD CONSTRAINT "PK_WIDGET" PRIMARY KEY ("WIDGET_TYPE","EMP_ID");

----------------------------------------------------------

------------------------ FK --------------------------------

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_DEPT_TO_EMP_1" FOREIGN KEY ("DEPT_CODE")
REFERENCES "DEPARTMENT" ("DEPT_CODE");

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "FK_JOB_TO_EMP_1" FOREIGN KEY ("JOB_CODE")
REFERENCES "JOB" ("JOB_CODE");

ALTER TABLE "RESERVATION" ADD CONSTRAINT "FK_EMP_TO_RESERV_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_EMP_TO_PAY_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "PROJECT" ADD CONSTRAINT "FK_EMP_TO_PJ_1" FOREIGN KEY ("PM_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "TODO" ADD CONSTRAINT "FK_TODO-B_TO_TODO_1" FOREIGN KEY ("TD_BOARD_NO")
REFERENCES "TODO_BOARD" ("TD_BOARD_NO");

ALTER TABLE "TODO" ADD CONSTRAINT "FK_TODO-B_TO_TODO_2" FOREIGN KEY ("EMP_ID")
REFERENCES "TODO_BOARD" ("TD_BOARD_NO");

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_EMP_TO_NOTICE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "FREE_REPLY" ADD CONSTRAINT "FK_EMP_TO_FREE_RE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "FREE_REPLY" ADD CONSTRAINT "FK_FREE_TO_FREE_RE_1" FOREIGN KEY ("REF_FID")
REFERENCES "FREE" ("FREE_NO");

ALTER TABLE "FREE_REPLY" ADD CONSTRAINT "FK_FREE_TO_FREE_RE_2" FOREIGN KEY ("FREE_RWRITER")
REFERENCES "FREE" ("FREE_NO");

ALTER TABLE "DOCUMENT" ADD CONSTRAINT "FK_EMP_TO_DOCU_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_DOCU_TO_APPROVAL_1" FOREIGN KEY ("DOCU_NUM")
REFERENCES "DOCUMENT" ("DOCU_NUM");

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_EMP_TO_APPROVAL_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "REFERENCE" ADD CONSTRAINT "FK_DOCUMENT_TO_REFERENCE_1" FOREIGN KEY ("DOCU_NUM")
REFERENCES "DOCUMENT" ("DOCU_NUM");

ALTER TABLE "REFERENCE" ADD CONSTRAINT "FK_EMP_TO_REFER_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "DOCUA" ADD CONSTRAINT "FK_DOCU_TO_DOCUA_1" FOREIGN KEY ("DOCU_NUM")
REFERENCES "DOCUMENT" ("DOCU_NUM");

ALTER TABLE "DOCUB" ADD CONSTRAINT "FK_DOCU_TO_DOCUB_1" FOREIGN KEY ("DOCU_NUM")
REFERENCES "DOCUMENT" ("DOCU_NUM");

ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_CHAT_TO_MSG_1" FOREIGN KEY ("CHAT_ID")
REFERENCES "CHAT" ("CHAT_ID");

ALTER TABLE "MESSAGE" ADD CONSTRAINT "FK_EMP_TO_MSG_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "FREE" ADD CONSTRAINT "FK_EMP_TO_FREE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "TEAM_BOARD" ADD CONSTRAINT "FK_EMP_TO_TEAM_B_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "FREE_LIKE" ADD CONSTRAINT "FK_EMP_TO_FREE_LIKE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "FREE_LIKE" ADD CONSTRAINT "FK_FREE_TO_FREE_LIKE_1" FOREIGN KEY ("FREE_NO")
REFERENCES "FREE" ("FREE_NO");

ALTER TABLE "TEAM_BOARD_REPLY" ADD CONSTRAINT "FK_EMP_TO_TEAM_B_RE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "TEAM_BOARD_REPLY" ADD CONSTRAINT "FK_TEAM_B_TO_TEAM_B_RE_1" FOREIGN KEY ("REF_TID")
REFERENCES "TEAM_BOARD" ("TEAM_BOARD_NO");

ALTER TABLE "TEAM_BOARD_REPLY" ADD CONSTRAINT "FK_TEAM_B_TO_TEAM_B_RE_2" FOREIGN KEY ("TEAM_RWRITER")
REFERENCES "TEAM_BOARD" ("TEAM_BOARD_NO");

ALTER TABLE "TODO_BOARD" ADD CONSTRAINT "FK_EMP_TO_TODO-B_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "MAIL" ADD CONSTRAINT "FK_EMP_TO_MAIL_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "FK_EMP_TO_SCHE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "PROJECT_REPLY" ADD CONSTRAINT "FK_PJ_TO_PJ_RE_1" FOREIGN KEY ("P_NO")
REFERENCES "PROJECT" ("P_NO");

ALTER TABLE "PROJECT_REPLY" ADD CONSTRAINT "FK_PJ_TO_PJ_RE_2" FOREIGN KEY ("P_RWRITER")
REFERENCES "PROJECT" ("P_NO");

ALTER TABLE "JOIN_CHAT" ADD CONSTRAINT "FK_CHAT_TO_JOIN_CHAT_1" FOREIGN KEY ("CHAT_ID")
REFERENCES "CHAT" ("CHAT_ID");

ALTER TABLE "JOIN_CHAT" ADD CONSTRAINT "FK_EMP_TO_JOIN_CHAT_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_PJ_TO_PJ_MEM_1" FOREIGN KEY ("P_NO")
REFERENCES "PROJECT" ("P_NO");

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_EMPE_TO_PJ_MEM_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "WORKTIME" ADD CONSTRAINT "FK_EMP_TO_WORKTIME_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "HELP" ADD CONSTRAINT "FK_EMP_TO_HELP_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "HELP" ADD CONSTRAINT "FK_EMP_TO_HELP_2" FOREIGN KEY ("HELPER_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "CHAT_FILE" ADD CONSTRAINT "FK_CHAT_TO_CHAT_FILE_1" FOREIGN KEY ("CHAT_ID")
REFERENCES "CHAT" ("CHAT_ID");

ALTER TABLE "CHAT_FILE" ADD CONSTRAINT "FK_EMP_TO_CHAT_FILE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "PROJECT_FILE" ADD CONSTRAINT "FK_PJ_TO_PJ_FILE_1" FOREIGN KEY ("P_NO")
REFERENCES "PROJECT" ("P_NO");

ALTER TABLE "PROJECT_FILE" ADD CONSTRAINT "FK_EMP_TO_PJ_FILE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "MAILFILE" ADD CONSTRAINT "FK_EMP_TO_MAILFILE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "DOCUMENT_FILE" ADD CONSTRAINT "FK_DOCU_TO_DOCU_FILE_1" FOREIGN KEY ("DOCU_NUM")
REFERENCES "DOCUMENT" ("DOCU_NUM");

ALTER TABLE "BOARD_FILE" ADD CONSTRAINT "FK_EMP_TO_B_FILE_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

ALTER TABLE "WIDGET" ADD CONSTRAINT "FK_EMP_TO_WIDGET_1" FOREIGN KEY ("EMP_ID")
REFERENCES "EMPLOYEE" ("EMP_ID");

----------------------------------------------------------

-------------------- SEQUENCE ------------------------------------
CREATE SEQUENCE EMP_SEQ
START WITH 10001;
CREATE SEQUENCE DEPT_SEQ
START WITH 8;
CREATE SEQUENCE JOB_SEQ
START WITH 6;
CREATE SEQUENCE DOCU_SEQ;
CREATE SEQUENCE DOCU_FILE_SEQ;
CREATE SEQUENCE HELP_SEQ;
CREATE SEQUENCE SCHE_SEQ;
CREATE SEQUENCE CHAT_SEQ;
CREATE SEQUENCE MSG_SEQ;
CREATE SEQUENCE CHAT_FILE_SEQ;
CREATE SEQUENCE MAIL_SEQ;
CREATE SEQUENCE MAIL_FILE_SEQ;
CREATE SEQUENCE NOTICE_SEQ;
CREATE SEQUENCE FREE_SEQ;
CREATE SEQUENCE TEAM_SEQ;
CREATE SEQUENCE FREE_RE_SEQ;
CREATE SEQUENCE TEAM_RE_SEQ;
CREATE SEQUENCE BOARD_FILE_SEQ;
CREATE SEQUENCE TODO_SEQ;
CREATE SEQUENCE TODO_BOARD_SEQ;
CREATE SEQUENCE PJ_SEQ;
CREATE SEQUENCE PJ_RE_SEQ;
CREATE SEQUENCE PJ_FILE_SEQ;




----------------------------------------------------------

-------------------- TRIGGER ------------------------------------



----------------------------------------------------------


-------------------- INSERT DEPARTMENT ------------------------------------
INSERT INTO DEPARTMENT VALUES(1,'DEVELOFFICE');
INSERT INTO DEPARTMENT VALUES(2,'경영지원팀(총무)');
INSERT INTO DEPARTMENT VALUES(3,'경영지원팀(인사)');
INSERT INTO DEPARTMENT VALUES(4,'경영지원팀(회계)');
INSERT INTO DEPARTMENT VALUES(5,'개발팀');
INSERT INTO DEPARTMENT VALUES(6,'서비스팀');
INSERT INTO DEPARTMENT VALUES(7,'영업팀');
----------------------------------------------------------


-------------------- INSERT JOB ------------------------------------
INSERT INTO JOB VALUES(1,'대표');
INSERT INTO JOB VALUES(2,'이사');
INSERT INTO JOB VALUES(3,'팀장');
INSERT INTO JOB VALUES(4,'대리');
INSERT INTO JOB VALUES(5,'사원');
----------------------------------------------------------


-------------------- INSERT EMPLOYEE ------------------------------------

--	"EMP_ID"		NUMBER				NOT NULL,
--	"EMP_NAME"		VARCHAR2(20)		NOT NULL,
--	"EMP_PWD"		VARCHAR2(2000)		NOT NULL,
--	"GENDER"		VARCHAR2(1)			CHECK(GENDER IN('M','F')),
--	"BIRTH"			DATE				NULL,
--	"DEPT_CODE"		NUMBER				NOT NULL,
--	"JOB_CODE"		NUMBER				NOT NULL,
--	"PHONE"			VARCHAR2(15)		NULL,
--	"EMAIL"			VARCHAR2(50)		NULL,
--	"ADDRESS"		VARCHAR2(200)		NULL,
--	"SALARY"		NUMBER				NULL,
--	"ACCOUNT"		VARCHAR2(50)		NOT NULL,
--	"STAR"			NUMBER	DEFAULT 0	NULL,
--	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
--	"RETIRE_DATE"	DATE				NULL,
--	"EMP_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	CHECK(EMP_STATUS IN('Y','N')),
--  "PROFILE_PATH"	VARCHAR2(200)		DEFAULT 'default_profile.png'    NOT NULL

INSERT INTO EMPLOYEE VALUES(EMP_SEQ.NEXTVAL,'전재광','1234','M','19850610',1,1,'01048992851','masta_jk@naver.com',
							'경기도 광명시 철산동',10000000,'01048992851','0',TO_DATE('20190415','YYYY-MM-DD'),NULL,DEFAULT,DEFAULT, NULL);

INSERT INTO EMPLOYEE VALUES(EMP_SEQ.NEXTVAL,'김상윤','1234','M','19901026',2,2,'01089819256','sangyoon5_4@naver.com',
							'경기도 성남시 수정구',8000000,'01089819256','0',TO_DATE('20190415','YYYY-MM-DD'),NULL,DEFAULT,DEFAULT, NULL);

INSERT INTO EMPLOYEE VALUES(EMP_SEQ.NEXTVAL, '원영주', '1234', 'F', '19940331', 6, 4, '01031563212', 'oneyj33@naver.com',
                            '강원도 춘천시 퇴계동', 7000000, '01031563212', '0', TO_DATE('20190415','YYYY-MM-DD'),NULL,DEFAULT,DEFAULT, NULL);

INSERT INTO EMPLOYEE VALUES(EMP_SEQ.NEXTVAL,'유현규','1234','M','19950712',5,5,'01092600714','yhg8484@naver.com',
							'경기도 성남시 중원구',5000000,'01092600714','0',TO_DATE('20190415','YYYY-MM-DD'),NULL,DEFAULT,DEFAULT, NULL);

INSERT INTO EMPLOYEE VALUES(EMP_SEQ.NEXTVAL, '설용환', '1234', 'M', '19890214', 3, 3, '01083311011', 'dydghks11@naver.com',
                            '서울시 송파구 문정동', 5000000, '01083311011', '0', TO_DATE('20190415','YYYY-MM-DD'),NULL,DEFAULT,DEFAULT, NULL);



-----------------WIDGET TEST INSERT----------------------------

--	"WIDGET_TYPE"	NUMBER		NOT NULL,
--	"EMP_ID"		NUMBER		NOT NULL,
--	"LEFT"			NUMBER		NULL,
--	"TOP"			NUMBER		NULL,
--	"FOLD"			VARCHAR2(1)	DEFAULT 'N'	CHECK(FOLD IN('Y','N')),
--	"STATUS"		VARCHAR2(1)	DEFAULT 'N'	CHECK(STATUS IN('Y','N'))

INSERT INTO WIDGET VALUES(1,10001,25,108,'N','Y');
INSERT INTO WIDGET VALUES(2,10001,25,108,'N','Y');
INSERT INTO WIDGET VALUES(3,10001,25,108,'N','Y');

INSERT INTO WIDGET VALUES(1,10002,25,108,'N','Y');
INSERT INTO WIDGET VALUES(2,10002,25,108,'N','Y');
INSERT INTO WIDGET VALUES(3,10002,25,108,'N','Y');

INSERT INTO WIDGET VALUES(1,10003,25,108,'N','Y');
INSERT INTO WIDGET VALUES(2,10003,25,108,'N','Y');
INSERT INTO WIDGET VALUES(3,10003,25,108,'N','Y');

INSERT INTO WIDGET VALUES(1,10004,25,108,'N','Y');
INSERT INTO WIDGET VALUES(2,10004,25,108,'N','Y');
INSERT INTO WIDGET VALUES(3,10004,25,108,'N','Y');

INSERT INTO WIDGET VALUES(1,10005,25,108,'N','Y');
INSERT INTO WIDGET VALUES(2,10005,25,108,'N','Y');
INSERT INTO WIDGET VALUES(3,10005,25,108,'N','Y');



------------------VIEW 생성------------------------------------
-- 직원테이블에 부서,직급이름 추가 
CREATE OR REPLACE VIEW EMP AS
SELECT EMP_ID,EMP_NAME,EMP_PWD,GENDER,BIRTH,DEPT_CODE,DEPT_NAME,JOB_CODE,
       JOB_NAME,PHONE,EMAIL,ADDRESS,SALARY,ACCOUNT,STAR,ENROLL_DATE,RETIRE_DATE,
       EMP_STATUS,PROFILE_PATH
FROM EMPLOYEE
JOIN DEPARTMENT USING(DEPT_CODE)
JOIN JOB USING(JOB_CODE)
ORDER BY EMP_ID;
							

----------------------------------------------------------


COMMIT;