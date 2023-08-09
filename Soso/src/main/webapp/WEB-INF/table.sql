-- 사용자(회원) 정보를 저장할 테이블
CREATE TABLE users(
    id VARCHAR2(100) PRIMARY KEY,
    pwd VARCHAR2(100) NOT NULL,
    email VARCHAR2(100),
    profile VARCHAR2(100), --프로필 이미지 경로를 저장할 칼럼
    regdate DATE
);
-- 사용자(회원) 정보 테이블 수정
ALTER TABLE users ADD username VARCHAR2(20) UNIQUE; -- 사용자 별명 (추후 drop가능성 있음)
ALTER TABLE users ADD birth DATE; -- 생년월일
ALTER TABLE users ADD gender VARCHAR2(20) CHECK( GENDER IN('남', '여', '비공개')); -- 성별

-- 업로드된 파일의 정보를 저장할 테이블
CREATE TABLE board_file(
    num NUMBER PRIMARY KEY,
    writer VARCHAR2(100) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    orgFileName VARCHAR2(100) NOT NULL, -- 원본 파일명
    saveFileName VARCHAR2(100) NOT NULL, -- 서버에 실제로 저장된 파일명
    fileSize NUMBER NOT NULL, -- 파일의 크기 
    regdate DATE
);

CREATE SEQUENCE board_file_seq; 

-- 게시글을 저장할 테이블 
CREATE TABLE board_cafe(
    num NUMBER PRIMARY KEY, --글번호
    writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
    title VARCHAR2(100) NOT NULL, --제목
    content CLOB, --글 내용
    viewCount NUMBER, -- 조회수
    regdate DATE --글 작성일
);
-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_seq; 

-- 댓글을 저장할 테이블
CREATE TABLE board_cafe_comment(
    num NUMBER PRIMARY KEY, --댓글의 글번호
    writer VARCHAR2(100), --댓글 작성자의 아이디
    content VARCHAR2(500), --댓글 내용
    target_id VARCHAR2(100), --댓글의 대상자 아이디
    ref_group NUMBER, -- 원글의 글번호
    comment_group NUMBER, -- 댓글의 그룹번호
    deleted CHAR(3) DEFAULT 'no', -- 삭제된 댓글인지 여부 'yes' or 'no'
    regdate DATE
);
-- 댓글의 글번호를 얻어낼 시퀀스
CREATE SEQUENCE board_cafe_comment_seq;

-- 갤러리를 만들기 위한 테이블 
CREATE TABLE board_gallery(
   num NUMBER PRIMARY KEY,
   writer VARCHAR2(100),
   caption VARCHAR2(100),   -- 이미지에 대한 설명
   imagePath VARCHAR2(100), -- 업로드된 이미지의 경로  ex) /resources/upload/xxx.jpg
   regdate DATE -- 이미지 업로드 날짜 
);

CREATE SEQUENCE board_gallery_seq;

--모임 테이블
CREATE TABLE board_group (
  num NUMBER PRIMARY KEY,
  writer VARCHAR2(100), -- 모임 주최
  title VARCHAR2(100), -- 모임의 이름
  caption VARCHAR2(200), -- 모임의 설명
  imagePath VARCHAR2(100), -- 모임의 대표 이미지 경로
  regdate DATE -- 업로드 날짜
);
-- 그룹 프라이머리 키
CREATE SEQUENCE board_group_seq;

--소모임 리뷰를 등록할 테이블
CREATE TABLE board_review(
    num NUMBER PRIMARY KEY, -- 후기 고유 번호
    title VARCHAR2(200), -- 소모임 이름(이걸로 join)
    writer VARCHAR2(100), -- 후기 작성자
    review VARCHAR2(600), -- 리뷰 남기기
    ref_group NUMBER, -- 리뷰 그룹의 멤
    rate NUMBER, -- 별점
    regdate DATE, --리뷰등록일자
    CONSTRAINT rate_range CHECK (rate >= 0 AND rate <= 5)-- 별점 제한사항 등록
);

-- 리뷰의 글번호를 얻어낼 시퀀스
CREATE SEQUENCE review_seq;

-- 소모임 가입을 위한 관리 테이블
CREATE TABLE board_join_group( -- 테이블 이름
memNum NUMBER PRIMARY KEY,--소모임 멤버 넘버
groupNum NUMBER, -- group테이블의 pk
memId VARCHAR2(40),
memNick VARCHAR2(20), -- 가입자의 닉네임
intro VARCHAR2(500),-- 자기소개
isjoin NUMBER NOT NULL, -- 0:승인, 1:대기, 2:거부 및 탈퇴
regdate DATE, -- 가입 신청 날짜
joindate DATE, -- 가입 허락 날짜
exdate DATE -- 탈퇴 날짜
)

-- 소모임 회원 PK
CREATE SEQUENCE join_seq;

-- 찜 기능을 위한 테이블
CREATE TABLE board_jjim(-- 찜 테이블
groupNum NUMBER, -- 소모임의 테이블 넘버를 저장할 칼럼
memId VARCHAR2(40) -- 찜하기 버튼 누른 사람의 id
)
