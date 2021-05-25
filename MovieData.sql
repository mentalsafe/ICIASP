
-- < 영화스트리밍 프로젝트 >

DROP VIEW MOMLIST;
DROP VIEW MOVIELIST;

DROP SEQUENCE MORNUM_SEQ;
DROP SEQUENCE MOVIE_SEQ;

DROP TABLE MOVIESAVE;
DROP TABLE MOVIEREVIEW;
DROP TABLE MOVIE;
DROP TABLE MOMEMBER;

--****************************************

-- 회원 테이블 (MOM)
CREATE TABLE MOMEMBER(
    MOMID       NVARCHAR2(10),              -- 아이디 (기본키)
    MOMPW       NVARCHAR2(10) NOT NULL,     -- 비밀번호
    MOMNAME     NVARCHAR2(5) NOT NULL,      -- 이름
    MOMBIRTH    DATE NOT NULL,              -- 생년월일
    MOMGENDER   NVARCHAR2(2) NOT NULL,      -- 성별
    MOMEMAIL    NVARCHAR2(30) NOT NULL,     -- 이메일
    MOMPHONE    NVARCHAR2(13) NOT NULL,     -- 핸드폰
    MOMMONEY    NUMBER DEFAULT 0,           -- 잔액
    MOMSUB      DATE DEFAULT NULL,          -- 구독권
    CONSTRAINT MOMID_PK PRIMARY KEY(MOMID)
);

SELECT * FROM MOMEMBER;

--****************************************

-- 영화 테이블 (MO)
CREATE TABLE MOVIE(
    MONUM       NUMBER,                     -- 영화번호 (기본키)
    MOTITLE     NVARCHAR2(50) NOT NULL,     -- 영화제목 NOT NULL
    MOPIC       NVARCHAR2(30) NOT NULL,     -- 영화사진 NOT NULL
    MOURL       NVARCHAR2(1000),            -- 영화영상
    MOCONTENTS  NVARCHAR2(1000) NOT NULL,   -- 줄거리 NOT NULL
    MOTIME      NVARCHAR2(10),              -- 상영시간
    MOGENRE     NVARCHAR2(20) NOT NULL,     -- 장르 NOT NULL
    MODATE      DATE,                       -- 개봉일
    MOACT       NVARCHAR2(50),              -- 출연진
    CONSTRAINT MONUM_PK PRIMARY KEY(MONUM)  
);

SELECT * FROM MOVIE;

SELECT MONUM, MOPIC, MOTITLE FROM MOVIE 
ORDER BY MONUM DESC;


DESC MOVIE;

--****************************************

-- 리뷰 테이블 (MOR)
CREATE TABLE MOVIEREVIEW(
    MORMONUM        NUMBER,                  -- 영화번호 (외래키)
    MORNUM          NUMBER,                  -- 리뷰번호 (기본키)
    MORID           NVARCHAR2 (10),          -- 아이디 (외래키)
    MORCONTENTS     NVARCHAR2(100),          -- 내용 
    MORSTAR         NVARCHAR2(5),            -- 별점
    CONSTRAINT MORNUM_PK PRIMARY KEY(MORNUM),
    FOREIGN KEY(MORID) REFERENCES MOMEMBER(MOMID),
    FOREIGN KEY(MORMONUM) REFERENCES MOVIE(MONUM)
);

SELECT * FROM MOVIEREVIEW;

--****************************************

-- 찜 테이블 (MOS)
CREATE TABLE MOVIESAVE (
    MOSID       NVARCHAR2(10) ,                 -- 아이디 (외래키)
    MOSNUM      NUMBER ,                 -- 영화번호 (외래키)
    
    FOREIGN KEY(MOSID) REFERENCES MOMEMBER(MOMID),
    FOREIGN KEY(MOSNUM) REFERENCES MOVIE(MONUM),
    
    CONSTRAINT MOSAVE_PK PRIMARY KEY (MOSID,MOSNUM)
);

SELECT * FROM MOVIESAVE;

--****************************************
-- 만들어야 할 것
-- 시퀀스 (리뷰번호) + 캐쉬삭제 / (영화번호) + 캐쉬삭제
-- VIEW (뷰) 생성 : 회원리스트, 영화리스트

--****************************************
-- 시퀀스
-- MOVIE_SEQ (영화번호) 시퀀스 만들기
CREATE SEQUENCE MOVIE_SEQ START WITH 38 INCREMENT BY 1;

-- MORNUM_SEQ (리뷰번호) 시퀀스 만들기
CREATE SEQUENCE MORNUM_SEQ START WITH 1 INCREMENT BY 1;

-- 시퀀스 조회
SELECT * FROM USER_SEQUENCES;

-- 캐쉬 사용안함
ALTER SEQUENCE MOVIE_SEQ NOCACHE;
ALTER SEQUENCE MORNUM_SEQ NOCACHE;

--****************************************
-- 뷰
-- (MOVIELIST) 영화 관리자용 리스트 VIEW 생성
CREATE VIEW MOVIELIST AS
            SELECT MOVIE.*, ROW_NUMBER() OVER(ORDER BY MONUM DESC) AS RN
            FROM MOVIE;
            
SELECT * FROM MOVIELIST;

-- (MOMLIST) 회원 관리자용 리스트 VIEW 생성
CREATE VIEW MOMLIST AS
            SELECT MOMEMBER.*, ROW_NUMBER() OVER(ORDER BY MOMNAME ASC) AS RN
            FROM MOMEMBER;

SELECT * FROM MOMLIST;


------------------------------------------------------------------------------------------------------------
--회원 정보

Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('admin','112233AA!','관리자',to_date('97/01/01','RR/MM/DD'),'남자','admin@naver.com','010-1234-5678',0,null);
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('aaaa','112233aa*','회원1',to_date('95/02/08','RR/MM/DD'),'남자','aaaa@naver.com','010-1111-5678',5000,to_date('21/04/12','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('bbbb','112233bb*','회원2',to_date('96/04/28','RR/MM/DD'),'남자','bbbb@naver.com','010-2222-5678',100,to_date('21/03/20','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('cccc','112233cc*','회원3',to_date('98/10/24','RR/MM/DD'),'여자','cccc@naver.com','010-3333-5678',0,null);
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('dddd','112233dd*','회원4',to_date('97/11/29','RR/MM/DD'),'여자','dddd@naver.com','010-4444-5678',1100,to_date('21/03/28','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('eeee','112233ee*','회원5',to_date('97/06/11','RR/MM/DD'),'여자','eeee@naver.com','010-5555-5678',100,to_date('21/03/21','RR/MM/DD'));

--영화 정보
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (1,'부산행','부산행.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/UOTOjA0ngmk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','전대미문의 재난이 대한민국을 덮친다!
정체불명의 바이러스가 전국으로 확산되고 대한민국 긴급재난경보령이 선포된 가운데,
열차에 몸을 실은 사람들은 단 하나의 안전한 도시 부산까지
살아가기 위한 치열한 사투를 벌이게 된다.
서울에서 부산까지의 거리 442KM
지키고 싶은, 지켜야만 하는 사람들의 극한의 사투!','118분','액션',to_date('16/07/20','RR/MM/DD'),'공유, 정유미, 마동석 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (2,'배테랑','베테랑.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/hcKp68DtBb0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','한 번 꽂힌 것은 무조건 끝을 보는 행동파 ‘서도철’(황정민),
20년 경력의 승부사 ‘오팀장’(오달수), 위장 전문 홍일점 ‘미스봉’(장윤주), 육체파 ‘왕형사’(오대환), 막내 ‘윤형사’(김시후)까지 겁 없고, 못 잡는 것 없고, 봐 주는 것 없는 특수 강력사건 담당 광역수사대.
오랫동안 쫓던 대형 범죄를 해결한 후 숨을 돌리려는 찰나, 서도철은 재벌 3세 ‘조태오’(유아인)를 만나게 된다.
베테랑 광역수사대 VS 유아독존 재벌 3세
2015년 여름, 자존심을 건 한판 대결이 시작된다!','123분 ','액션',to_date('15/08/05','RR/MM/DD'),'황정민, 유아인, 유해진 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (3,'극한직업','극한직업.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/xM1CIQd_X4c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','낮에는 치킨장사! 밤에는 잠복근무!
지금까지 이런 수사는 없었다!
불철주야 달리고 구르지만 실적은 바닥, 급기야 해체 위기를 맞는 마약반!
더 이상 물러설 곳이 없는 팀의 맏형 고반장은 국제 범죄조직의 국내 마약 밀반입 정황을 포착하고 장형사, 마형사, 영호, 재훈까지 4명의 팀원들과 함께 잠복 수사에 나선다.','111분  ','코미디',to_date('19/01/23','RR/MM/DD'),'류승룡, 이하늬, 진선규 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (5,'곡성','곡성.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Ej25zrnaTXk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','낯선 외지인(쿠니무라 준)이 나타난 후 벌어지는 의문의 연쇄 사건들로 마을이 발칵 뒤집힌다.
경찰은 집단 야생 버섯 중독으로 잠정적 결론을 내리지만 모든 사건의 원인이 그 외지인 때문이라는 소문과 의심이 걷잡을 수 없이 퍼져 나간다.','156분 ','호러',to_date('16/05/12','RR/MM/DD'),'곽도원, 황정민 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (6,'범죄도시','범죄도시.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/3DOZUhe2xWk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','대한민국을 뒤흔든 ‘장첸(윤계상 분)’ 일당을 잡기 위해 오직 주먹 한방으로 도시의 평화를 유지해 온 괴물형사 ‘마석도(마동석 분)’와 인간미 넘치는 든든한 리더 ‘전일만(최귀화 분)’ 반장이 이끄는 강력반은 나쁜 놈들을 한방에 쓸어버릴 끝.짱.나.는. 작전을 세우는데…
통쾌하고! 화끈하고! 살벌하게!
나쁜 놈들 때려잡는 강력반 형사들의 ‘조폭소탕작전’이 시작된다!','121분 ','액션',to_date('17/10/03','RR/MM/DD'),'마동석, 윤계상 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (7,'암살','암살.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/RnGxpZ75zFU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1933년 조국이 사라진 시대
대한민국 임시정부는 일본 측에 노출되지 않은 세 명을 암살작전에 지목한다. 한국 독립군 저격수 안옥윤, 신흥무관학교 출신 속사포, 폭탄 전문가 황덕삼! 김구의 두터운 신임을 받는 임시정부 경무국 대장 염석진은 이들을 찾아 나서기 시작한다. 암살단의 타깃은 조선주둔군 사령관 카와구치 마모루와 친일파 강인국. 한편, 누군가에게 거액의 의뢰를 받은 청부살인업자 하와이 피스톨이 암살단의 뒤를 쫓는데...
친일파 암살작전을 둘러싼 이들의 예측할 수 없는 운명이 펼쳐진다!','139분','액션',to_date('15/07/22','RR/MM/DD'),'전지현, 이정재, 하정우 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (8,'월드워Z','월드워Z.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/BsmDoCph6eI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','전 세계 이상 기류… 거대한 습격이 시작된다!
의문의 항공기 습격, 국가별 입국 전면 통제, 국경선을 둘러싼 높은 벽,
세계 곳곳에서 원인을 알 수 없는 이변이 일어나기 시작한다.
그리고 정체불명 존재들의 무차별적 공격으로 도시는 순식간에 아수라장으로 변한다.','115분 ','호러',to_date('13/06/20','RR/MM/DD'),'브래드 피트, 미레유 에노스 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (9,'미드나잇 선','미드나잇 선.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IgyknlJ79kM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','XP(색소성건피증)라는 희귀병으로 태양을 피해야만 하는 케이티.
오직 밤에만 외출이 허락된 그녀에게는 어머니가 남겨준 기타와 창문 너머로 10년째 짝사랑해온 ‘찰리’가 세상의 빛이다.
어느 날 작은 기차역에서 한밤의 버스킹을 하던 ‘케이티’의 앞에 ‘찰리’가 나타나고, 두 사람은 매일 밤마다 모두가 부러워하는 완벽한 데이트를 이어간다.
처음으로 함께 여행을 떠난 날, 꿈 같은 시간을 보내던 ‘케이티’는 그만 지켜야만 하는 규칙을 어기게 되고 결국 피할 수 없는 선택을 해야만 하는데…
너에게 하고 싶은 진짜 사랑 고백
태양이 뜬 뒤에도 내 곁에 있어줄래?','92분 ','로맨스',to_date('18/06/21','RR/MM/DD'),'벨라 손, 패트릭 슈왈제네거 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (10,'인셉션','인셉션.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/hx1fqhNoH8A" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','타인의 꿈에 들어가 생각을 훔치는 특수 보안요원 코브.
그를 이용해 라이벌 기업의 정보를 빼내고자 하는 사이토는 코브에게 생각을 훔치는 것이 아닌, 생각을 심는 ‘인셉션’ 작전을 제안한다.
성공 조건으로 국제적인 수배자가 되어있는 코브의 신분을 바꿔주겠다는 거부할 수 없는 제안을 하고, 사랑하는 아이들에게 돌아가기 위해 그 제안을 받아들인다. 최강의 팀을 구성, 표적인 피셔에게 접근해서 ‘인셉션’ 작전을 실행하지만 예기치 못한 사건들과 마주하게 되는데…','147분 ','액션',to_date('10/07/21','RR/MM/DD'),'레오나르도 디카프리오, 와타나베 켄 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (11,'메이즈러너','메이즈러너.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/EQWqsdOjvG8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','삭제된 기억, 거대한 미로로 둘러싸인 낯선 공간
모든 기억이 삭제된 채 의문의 장소로 보내진 ‘토마스’(딜런 오브라이언).
‘토마스’는 미로에 갇힌 그곳에서 자신과 같은 상황의 사람들을 만난다.
그들은 매일 밤 살아 움직이는 미로에서 정체를 알 수 없는 죽음의 존재와 대립하며, 지옥으로부터 빠져나갈 탈출구인 지도를 완성해 나간다.
그러던 어느 날, 미로의 문이 열리고 그들은 마지막 선택의 기로에 놓이게 되는데…','113분 ','액션',to_date('14/09/18','RR/MM/DD'),'딜런 오브라이언, 카야 스코델라리오, 토마스 생스터 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (12,'헝거게임 : 판엠의 불꽃','헝거게임_판엠의 불꽃.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/9pfVCKaheGQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','무기는 단 하나! 모든 과정은 생중계된다!
승자와 패자를 결정하는 건 오로지 운명뿐!
세상을 변화시킬 거대한 혁명의 불꽃이 타오른다!
12개의 구역으로 이루어진 독재국가 ‘판엠’이 체재를 유지하기 위해 만든 생존 전쟁 ‘헝거게임’. 일년에 한번 각 구역에서 추첨을 통해 두 명을 선발, 총 24명이 생존을 겨루게 되는 것.','142분','액션',to_date('12/04/05','RR/MM/DD'),'제니퍼 로렌스, 조쉬 허처슨 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (13,'맘마미아!2','맘마미아2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/q9B6pctppK4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','전세계가 사랑한 최고의 뮤지컬 영화가 돌아온다!
“인생은 짧고 세상은 넓어. 멋진 추억을 만들고 싶어!”
엄마 도나(메릴 스트립)의 모든 것이 담긴 호텔 재개장을 준비하며 홀로서기를 결심한 소피. 그녀는 엄마의 영원한 친구 타냐와 로지, 그리고 사랑스러운 세 아빠들 샘, 해리, 빌에게 리오픈 파티 초대장을 보낸다.
한편 소피는 파티 준비 중 엄마의 숨겨진 찬란했던 추억과 비밀을 들여다보게 되고, 뜻밖의 손님까지 방문하는데… 과연 한여름의 파티는 무사히 열릴 수 있을까?
 “엄마가 자랑스러워할 인생 최고의 파티를 열게요!”','114분','로맨스',to_date('18/08/08','RR/MM/DD'),'메릴 스트립, 피어스 브로스넌, 콜린 퍼스 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (14,'패신저스','패신저스.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/jnPm62HjYE8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','선택된 두 사람, 모두의 운명을 구해야 한다!
120년 후의 개척 행성으로 떠나는 초호화 우주선 아발론 호. 
여기엔 새로운 삶을 꿈꾸는 5,258명의 승객이 타고 있다. 
그러나 알 수 없는 이유로 인해 짐 프레스턴(크리스 프랫)과 오로라 레인(제니퍼 로렌스)은 90년이나 일찍 동면 상태에서 깨어나게 된다.
서서히 서로를 의지하게 되는 두 사람은 우주선에 치명적인 결함이 있다는 사실을 발견하게 되고, 마침내 그들이 남들보다 먼저 깨어난 이유를 깨닫게 되는데…','116분 ','SF',to_date('17/01/04','RR/MM/DD'),'제니퍼 로렌스, 크리스 프랫 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (15,'쥬라기 월드','쥬라기 월드.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/xfvxK19CqQw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','살아있는 모든 것을 압도할 그들이 깨어났다!
‘쥬라기 공원’이 문을 닫은 지 22년, 유전자 조작으로 탄생한 공룡들을 앞세운 ‘쥬라기 월드’는 지상 최대의 테마파크로 자리잡는다.
하지만 새롭게 태어난 하이브리드 공룡들은 지능과 공격성을 끝없이 진화시키며 인간의 통제를 벗어나기 시작하는데… 
돌아온 공룡의 세상! 인류에게 닥친 최악의 위협!','125분 ','액션',to_date('15/06/11','RR/MM/DD'),'크리스 프랫, 브라이스 달라스 하워드 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (16,'혹성탈출 : 진화의 시작','혹성탈출_진화의 시작.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IU2J6u5-MS0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','진화는 인류를 위협하는 혁명이다!
과학자 ‘윌 로드만(제임스 프랭코 분)’은 알츠하이머 병에 걸린 아버지(존 리스고 분)를 치료하고자 인간의 손상된 뇌기능을 회복시켜주는 ‘큐어’를 개발한다. 이 약의 임상실험으로 유인원들이 이용되고, 한 유인원에게서 어린 ‘시저(앤디 서키스 분)’가 태어나 ‘윌’은 자신 집에서 ‘시저’를 키우게 된다. 가족같이 살고 있던 윌과 시저, 시간이 지날수록 ‘시저’의 지능은 인간을 능가하게 된다. 그러던 어느 날, ‘시저’는 이웃집 남자와 시비가 붙은 ‘윌’의 아버지를 본능적으로 보호하려는 과정에서 인간을 공격하게 되고, 결국 유인원들을 보호하는 시설로 보내지게 된다. 그곳에서 자신이 인간과 다른 존재라는 것을 서서히 자각하게 되고 인간이 유인원을 어떻게 대하는지 보게 된 ‘시저’는 다른 유인원들과 함께 생존을 걸고 인간들과의 대전쟁을 결심하는데……','106분','SF',to_date('11/08/17','RR/MM/DD'),'제임스 프랭코, 프리다 핀토, 앤디 서키스 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (17,'나의 소녀시대','나의 소녀시대.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/TgH9V75cNtI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','고마워, 내 소중한 추억이 되어줘서
돌아가고 싶은 리즈시절(?) 숨기고 싶은 흑역사(!)
1994년 대책 없이 용감했던 고딩시절, 유덕화 마누라가 꿈인 평범한 소녀 ‘린전신’과 학교를 주름잡는 비범한 소년 ‘쉬타이위’의 첫사랑 밀어주기 작전','134분','로맨스',to_date('16/05/11','RR/MM/DD'),'송운화, 왕대륙, 이옥새 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (18,'건축학개론','건축학개론.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/PxfE7MUQB2g" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','어쩌면…사랑할 수 있을까? 건축학개론 수업에서 그녀를 처음 만났다.
생기 넘치지만 숫기 없던 스무 살, 건축학과 승민은 ''건축학개론'' 수업에서 처음 만난 음대생 서연에게 반한다. 
함께 숙제를 하게 되면서 차츰 마음을 열고 친해지지만, 자신의 마음을 표현하는 데 서툰 순진한 승민은 입 밖에 낼 수 없었던 고백을 마음 속에 품은 채 작은 오해로 인해 서연과 멀어지게 된다. 어쩌면 다시…사랑할 수 있을까? 15년 만에 그녀를 다시 만났다','118분 ','로맨스',to_date('12/03/22','RR/MM/DD'),'엄태웅, 한가인, 이제훈, 수지 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (19,'뷰티인사이드','뷰티인사이드.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/ESPFTY8Y-xM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','남자, 여자, 아이, 노인.. 심지어 외국인까지! 자고 일어나면 매일 다른 모습으로 변하는 남자, ‘우진’.
그에게 처음으로 비밀을 말하고 싶은 단 한 사람이 생겼다.
드디어 D-DAY! ‘우진’은 그녀에게 자신의 마음을 고백하기로 하는데…
“초밥이 좋아요? 스테이크가 좋아요?
사실.. 연습 엄청 많이 했어요.
오늘 꼭 그쪽이랑 밥 먹고 싶어서…”','127분 ','로맨스',to_date('15/08/20','RR/MM/DD'),'한효주, 김대명, 도지한 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (20,'컨저링2','컨저링2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/X1awKDMbw34" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1977년 영국 엔필드. 엄마 페기와 네 남매가 살고 있는 가족의 집에 정체를 알 수 없는 존재가 나타난다. 
일명 폴터가이스트 유령. 벽을 두드리는 소리, 사악한 목소리, 유령은 밤마다 가구와 물건들, 심지어 아이들까지 공중에 띄우는 등 기이한 일들을 일으킨다. 결국 교회의 요청을 받은 워렌 부부가 영국 엔필드의 집을 찾아가 사건을 조사한다. 그러나 워렌 부부는 그 집에서 예상보다 더욱 엄청난 상대를 만나게 되고, 워렌 부부의 목숨까지 위협받는데…','134분','호러',to_date('16/06/09','RR/MM/DD'),'베라 파미가, 패트릭 윌슨, 프란카 포텐테 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (21,'럭키','럭키.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/6RUSZWD0JHc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','냉혹한 킬러 형욱(유해진)은 사건 처리 후 우연히 들른 목욕탕에서 비누를 밟고 넘어져 과거의 기억을 잃게 된다. 
인기도, 삶의 의욕도 없어 죽기로 결심한 무명배우 재성(이준)은 신변 정리를 위해 들른 목욕탕에서 그런 형욱을 보게 되고, 자신과 그의 목욕탕 키를 바꿔 도망친다. 이후 형욱은 자신이 재성이라고 생각한 채, 배우로 성공하기 위해 노력하는데… 
인생에 단 한번 찾아온 초대형 기회! 초특급 반전! 이것이 LUCK.KEY다!','112분','코미디',to_date('16/10/13','RR/MM/DD'),'유해진, 이준, 조윤희, 임지연 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (22,'하울의 움직이는 성','하울의 움직이는 성.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/YpqMZt1gOXU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','어느 날, 영문도 모른 채 마녀의 저주로 인해 할머니가 된 소녀 ''소피'' 절망 속에서 길을 걷다가 거대한 마법의 성에 들어가게 된다. 
그곳에서 자신과 마법사 하울의 계약을 깨주면 저주를 풀어주겠다는 불꽃악마 캘시퍼의 제안을 받고 청소부가 되어 ‘움직이는 성’에 머물게 되는데…','119분','애니메이션',to_date('04/12/24','RR/MM/DD'),'바이쇼 치에코, 기무라 타쿠야 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (23,'매트릭스','매트릭스.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/9mn4seqI8Vs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','인간의 기억마저 AI에 의해 입력되고 삭제 되는 세상.
진짜보다 더 진짜 같은 가상 현실 ‘매트릭스’ 그 속에서 진정한 현실을 인식할 수 없게 재배되는 인간들. 
그 ‘매트릭스’를 빠져 나오면서 AI에게 가장 위험한 인물이 된 ''모피어스’는 자신과 함께 인류를 구할 마지막 영웅 ‘그’를 찾아 헤맨다. 
마침내 ‘모피어스’는 낮에는 평범한 회사원으로, 밤에는 해커로 활동하는 청년 ‘네오’를 ‘그’로 지목하는데… 
꿈에서 깨어난 자들, 이제 그들이 만드는 새로운 세상이 열린다!','136분','SF',to_date('99/05/15','RR/MM/DD'),'키아누 리브스, 로렌스 피시번, 캐리 앤 모스 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (24,'터미네이터2 : 오리지널','터미네이터2_오리지널.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Bxx7-sPKt84" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','미래, 인류와 기계의 전쟁은 계속 되는 가운데 스카이넷은 인류 저항군 사령관 존 코너를 없애기 위해 
액체 금속형 로봇인 T-1000을 과거의 어린 존 코너에게로 보낸다. 
미래의 인류 운명을 쥔 어린 존 코너. 
스카이넷의 T-1000은 거침없이 숨 가쁜 추격을 시작하는데…','137분','SF',to_date('91/07/06','RR/MM/DD'),'아놀드 슈왈제네거, 린다 해밀턴, 에드워드 펄롱 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (25,'너의 이름은','너의 이름은.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/enRm-9qF2L8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','아직 만난 적 없는 너를, 찾고 있어 천년 만에 다가오는 혜성 기적이 시작된다. 도쿄에 사는 소년 ‘타키’와 시골에 사는 소녀 ‘미츠하’는 서로의 몸이 뒤바뀌는 신기한 꿈을 꾼다. 낯선 가족, 낯선 친구들, 낯선 풍경들... 반복되는 꿈과 흘러가는 시간 속, 마침내 깨닫는다. 우리, 서로 뒤바뀐 거야? 절대 만날 리 없는 두 사람 반드시 만나야 하는 운명이 되다 서로에게 남긴 메모를 확인하며 점점 친구가 되어가는 ‘타키’와 ‘미츠하’ !
언제부턴가 더 이상 몸이 바뀌지 않자 자신들이 특별하게 이어져있었음을 깨달은 ‘타키’는 ‘미츠하’를 만나러 가는데... 
잊고 싶지 않은 사람 잊으면 안 되는 사람 너의 이름은?','106분','애니메이션',to_date('18/01/04','RR/MM/DD'),'카미키 류노스케, 카미시라이시 모네 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (26,'신비한 동물사전','신비한 동물사전.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IbfT6qVkll8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','‘뉴트 스캐맨더’(에디 레드메인)의 활약으로 강력한 어둠의 마법사 ‘겔러트 그린델왈드’(조니 뎁)가 미합중국 마법부 MACUSA에 붙잡히지만, 
이내 장담했던 대로 탈출해 추종자를 모으기 시작한다. 
순혈 마법사의 세력을 모아 마법을 사용하지 않는 사람들을 지배하려는 그린델왈드의 야욕을 막기 위해 ‘알버스 덤블도어’(주드 로)는 제자였던 뉴트에게 도움을 요청한다. 
마법사 사회는 점점 더 분열되어 가는 가운데, 앞날의 위험을 알지 못한 채 뉴트는 이를 승낙하는데…','134분','판타지',to_date('18/11/14','RR/MM/DD'),'애디 레드메인, 조니 뎁, 캐서린 워터스턴 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (27,'어바웃 타임','어바웃 타임.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/tnyWkyDGWuM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','모태솔로 팀(돔놀 글리슨)은 성인이 된 날, 아버지(빌 나이)로부터 놀랄만한 가문의 비밀을 듣게 된다. 바로 시간을 되돌릴 수 있는 능력이 있다는 것! 그것이 비록 히틀러를 죽이거나 여신과 뜨거운 사랑을 할 수는 없지만, 여자친구는 만들어 줄 순 있으리.. 
꿈을 위해 런던으로 간 팀은 우연히 만난 사랑스러운 여인 메리에게 첫눈에 반하게 된다. 그녀의 사랑을 얻기 위해 자신의 특별한 능력을 마음껏 발휘하는 팀. 어설픈 대시, 어색한 웃음은 리와인드! 뜨거웠던 밤은 더욱 뜨겁게 리플레이! 꿈에 그리던 그녀와 매일매일 최고의 순간을 보낸다. 하지만 그와 그녀의 사랑이 완벽해질수록 팀을 둘러싼 주변 상황들은 미묘하게 엇갈리고, 예상치 못한 사건들이 여기저기 나타나기 시작하는데… 
어떠한 순간을 다시 살게 된다면, 과연 완벽한 사랑을 이룰 수 있을까?','123분','로맨스',to_date('13/12/05','RR/MM/DD'),'도널 글리슨, 레이첼 맥아담스 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (28,'악마는 프라다를 입는다','악마는 프라다를 입는다.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/2wnvmS1A7O8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','최고의 패션 매거진 ‘런웨이’에 기적 같이 입사했지만 ‘앤드리아’(앤 해서웨이)에겐 이 화려한 세계가 그저 낯설기만 하다.
 원래의 꿈인 저널리스트가 되기 위해 딱 1년만 버티기로 결심하지만 악마 같은 보스, ‘런웨이’ 편집장 ‘미란다’(메릴 스트립)와 일하는 것은 정말 지옥 같은데…!!
24시간 울려대는 휴대폰, 남자친구 생일도 챙기지 못할 정도의 풀 야근,
 심지어 그녀의 쌍둥이 방학 숙제까지! 꿈과는 점점 멀어지고.. 잡일 전문 쭈구리 비서가 된 ''앤드리아''! 오늘도 ‘미란다’의 칼 같은 질타와 불가능해 보이는 미션에 고군분투하는 ‘앤드리아’
과연, 전쟁 같은 이곳에서 버틸 수 있을까?','109분 ','코미디',to_date('06/10/25','RR/MM/DD'),'메릴 스트립, 앤 해서웨이 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (29,'라푼젤','라푼젤.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/ow9woC6-9Q8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','누구도 상상못한 위대한 가출(?)이 시작된다
올드보이도 못 견뎠을 장장18년을 탑 안에서만 지낸 끈기만점의 소녀 라푼젤. 어느 날 자신의 탑에 침입한 왕국 최고의 대도를 한방에 때려잡는다. 그리고 그를 협박해 꿈에도 그리던 집밖으로의 모험을 단행한다. 
과잉보호 모친의 영향으로 세상을 험난한 곳으로만 상상하던 라푼젤. 
그런 그녀 앞에 군기 빡 쎈 왕실 경비마 맥시머스의 추격, 라이더에게 복수의 칼날을 가는 스태빙턴 형제의 위협, 라푼젤의 가짜 엄마 고델의 무서운 음모 등이 얽히고 설켜 점점 흥미진진한 사건들이 터지기 시작한다. 그러나 세상물정 깜깜한 우리의 라푼젤은 자신 앞에 펼쳐진 스릴 넘치는 세상을 맘껏 즐기는데...','100분','애니메이션',to_date('11/02/10','RR/MM/DD'),'맨디 무어, 제커리 레비 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (30,'인터스텔라','인터스텔라.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/d2VN6NNa9BE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','“우린 답을 찾을 거야, 늘 그랬듯이”
세계 각국의 정부와 경제가 완전히 붕괴된 미래가 다가온다.
 지난 20세기에 범한 잘못이 전 세계적인 식량 부족을 불러왔고, NASA도 해체되었다. 이때 시공간에 불가사의한 틈이 열리고, 남은 자들에게는 이 곳을 탐험해 인류를 구해야 하는 임무가 지워진다. 사랑하는 가족들을 뒤로 한 채 인류라는 더 큰 가족을 위해, 그들은 이제 희망을 찾아 우주로 간다. 그리고 우린 답을 찾을 것이다. 늘 그랬듯이…','169분 ','SF',to_date('14/11/06','RR/MM/DD'),'매튜 맥커너히, 앤 해서웨이 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (31,'토이 스토리4','토이스토리4.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/u8GQibRXVHg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','우리의 여행은 아직 끝나지 않았다!
장난감의 운명을 거부하고 떠난 새 친구 ‘포키’를 찾기 위해 길 위에 나선 ‘우디’는 우연히 오랜 친구 ‘보핍’을 만나고 그녀를 통해 새로운 세상에 눈을 뜨게 된다. 한편, ‘버즈’와 친구들은 사라진 ‘우디’와 ‘포키’를 찾아 세상 밖 위험천만한 모험을 떠나게 되는데…','100분 ','애니메이션',to_date('19/06/20','RR/MM/DD'),'톰 행크스, 팀 알렌 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (32,'해리포터와 마법사의 돌','해리포터와 마법사의 돌.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/524LTjLx9x0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','11살 생일을 며칠 앞둔 어느 날 해리에게 초록색 잉크로 쓰여진 한 통의 편지가 배달된다. 그 편지의 내용은 다름 아닌 해리의 11살 생일을 맞이하여 전설적인“호그와트 마법학교”에서 보낸 입학초대장이었다. 
그리고 해리의 생일을 축하하러 온 거인 해그리드는 해리가 모르고 있었던 해리의 진정한 정체를 알려주는데. 
그것은 바로 해리가 굉장한 능력을 지닌 마법사라는 것!
런던의 킹스크로스 역에 있는 비밀의 9와 3/4 승장장에서 호그와트 특급열차를 탄 해리는 열차 안에서 같은 호그와트 마법학교 입학생인 헤르미온느 그레인저와 론 위즐리를 만나 친구가 된다. 
이들과 함께 호그와트에 입학한 해리는, 놀라운 모험의 세계를 경험하며 갖가지 신기한 마법들을 배워 나간다.','152분 ','판타지',to_date('01/12/14','RR/MM/DD'),'다니엘 래드클리프, 루퍼트 그린트, 엠마 왓슨 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (33,'해리포터와 비밀의 방','해리포터와 비밀의 방.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/5s8hdouZmG8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1학년 때 해리가 보여준 영웅적인 활약상은 학교 전체에 소문이 나고, 그 덕에 해리는 원치 않는 관심의 초점이 된다. 론의 여동생 지니, 사진작가 지망생 콜린 크리비 등의 신입생과 어둠의 마법 방어술을 가르치는 신임 교수 질데로이 록허트가 새롭게 해리포터의 팬이 된다.
남의 시선 끌기를 좋아하는 잘난척하는 성격 탓에 주변에서 따돌림 당하는 록허트 교수는 해리와 친해지고 싶어 안달하지만, 그 역시 학교에서 일어나는 무서운 사건에 대해 뾰족한 설명을 못해준다. 
모든 이목은 해리에게 집중되고, 결국 급우들은 해리를 의심하기에 이른다. 물론 론과 헤르미온느, 그리고 수수께끼의 일기장에 마음을 뺏긴 론의 동생 지니만은 끝까지 해리를 믿는다.
자신을 믿는 친구들을 실망시킬 수는 없는 법. 
해리는 -도움을 준다며 되려 걸리적 대는 록허트 교수가 다소 방해가 되긴 하지만- 어둠의 세력과 맞서 싸울 결심을 하는데..','162분 ','판타지',to_date('02/12/13','RR/MM/DD'),'다니엘 래드클리프, 루퍼트 그린트, 엠마 왓슨 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (34,'어벤져스 : 엔드게임','어벤져스_엔드게임.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Ko2NWhXI9e8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','인피니티 워 이후 절반만 살아남은 지구
마지막 희망이 된 어벤져스
먼저 떠난 그들을 위해 모든 것을 걸었다!
위대한 어벤져스
운명을 바꿀 최후의 전쟁이 펼쳐진다!','181분 ','액션',to_date('19/04/24','RR/MM/DD'),'로버트 다우니 주니어, 크리스 에반스, 크리스 헴스워스등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (35,'겨울왕국2','겨울왕국2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/eSEs4B4H-EA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','내 마법의 힘은 어디서 왔을까?
나를 부르는 저 목소리는 누구지?
어느 날 부턴가 의문의 목소리가 엘사를 부르고, 평화로운 아렌델 왕국을 위협한다. 트롤은 모든 것은 과거에서 시작되었음을 알려주며 엘사의 힘의 비밀과 진실을 찾아 떠나야한다고 조언한다.
위험에 빠진 아렌델 왕국을 구해야만 하는 엘사와 안나는 숨겨진 과거의 진실을 찾아 크리스토프, 올라프 그리고 스벤과 함께 위험천만한 놀라운 모험을 떠나게 된다. 자신의 힘을 두려워했던 엘사는 이제 이 모험을 헤쳐나가기에 자신의 힘이 충분하다고 믿어야만 하는데…
두려움을 깨고 새로운 운명을 만나다!','103분 ','애니메이션',to_date('19/11/21','RR/MM/DD'),'크리스틴 벨, 이디나 멘젤 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (36,'트와일라잇','트와일라잇.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/PxuedpqCF2o" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','얼음보다 차갑고 빛보다 빠른 그가 온다!
17세의 평범한 고등학생 소녀 ‘벨라’는 집안 사정으로 워싱턴 주 포크스에 있는 아빠의 집으로 이사를 온다. 전학 첫날, ‘벨라’는 냉담하지만 자신을 무장 해제시킬 정도로 잘생긴 ‘에드워드’와 마주치고, 전율과 두려움 넘치는 인생의 전환을 맞이한다. ‘에드워드’와 돌이킬 수 없는 사랑에 빠져든 ‘벨라’. 하지만 ‘에드워드’와 그의 가족이 뱀파이어 일족이라는 사실을 알게 되고, 예기치 못한 운명에 빠져든다.','121분','로맨스',to_date('08/12/10','RR/MM/DD'),'크리스틴 스튜어트, 로버트 패틴슨 등');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (37,'라라랜드','라라랜드.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Dt5hFexM5BI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','황홀한 사랑, 순수한 희망, 격렬한 열정…
이 곳에서 모든 감정이 폭발한다!
꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’.
재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.','127분','로맨스',to_date('16/12/07','RR/MM/DD'),'라이언 고슬링, 엠마 스톤 등');





--리뷰 정보

Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,1,'aaaa','첫 시작부터 엔딩까지 명장면이 손꼽을 수 없이 많다.','5점');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,2,'dddd','서로의 꿈을 돌봐주고 키워가며 각자의 길을 응원하는 최고의 뮤지컬!!!','4점');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,5,'aaaa','영화 마지막 5분의 여운이 아직도 선명하다...','4점');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,4,'bbbb','정말 여러번 봐도 감동적이고 예쁜 영상미랑 OST 너무 좋아요ㅠㅠ 진짜 인생영화입니다','5점');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,6,'eeee','전 너무 지루하고 재미없었어요...','1점');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,8,'dddd','낭만적인 영화! 재밌었어요','4점');






COMMIT;

SELECT * FROM MOMEMBER;

SELECT * FROM MOVIEREVIEW;

SELECT * FROM MOVIE;

SELECT * FROM MOVIESAVE;

