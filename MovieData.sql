
-- < ��ȭ��Ʈ���� ������Ʈ >

DROP VIEW MOMLIST;
DROP VIEW MOVIELIST;

DROP SEQUENCE MORNUM_SEQ;
DROP SEQUENCE MOVIE_SEQ;

DROP TABLE MOVIESAVE;
DROP TABLE MOVIEREVIEW;
DROP TABLE MOVIE;
DROP TABLE MOMEMBER;

--****************************************

-- ȸ�� ���̺� (MOM)
CREATE TABLE MOMEMBER(
    MOMID       NVARCHAR2(10),              -- ���̵� (�⺻Ű)
    MOMPW       NVARCHAR2(10) NOT NULL,     -- ��й�ȣ
    MOMNAME     NVARCHAR2(5) NOT NULL,      -- �̸�
    MOMBIRTH    DATE NOT NULL,              -- �������
    MOMGENDER   NVARCHAR2(2) NOT NULL,      -- ����
    MOMEMAIL    NVARCHAR2(30) NOT NULL,     -- �̸���
    MOMPHONE    NVARCHAR2(13) NOT NULL,     -- �ڵ���
    MOMMONEY    NUMBER DEFAULT 0,           -- �ܾ�
    MOMSUB      DATE DEFAULT NULL,          -- ������
    CONSTRAINT MOMID_PK PRIMARY KEY(MOMID)
);

SELECT * FROM MOMEMBER;

--****************************************

-- ��ȭ ���̺� (MO)
CREATE TABLE MOVIE(
    MONUM       NUMBER,                     -- ��ȭ��ȣ (�⺻Ű)
    MOTITLE     NVARCHAR2(50) NOT NULL,     -- ��ȭ���� NOT NULL
    MOPIC       NVARCHAR2(30) NOT NULL,     -- ��ȭ���� NOT NULL
    MOURL       NVARCHAR2(1000),            -- ��ȭ����
    MOCONTENTS  NVARCHAR2(1000) NOT NULL,   -- �ٰŸ� NOT NULL
    MOTIME      NVARCHAR2(10),              -- �󿵽ð�
    MOGENRE     NVARCHAR2(20) NOT NULL,     -- �帣 NOT NULL
    MODATE      DATE,                       -- ������
    MOACT       NVARCHAR2(50),              -- �⿬��
    CONSTRAINT MONUM_PK PRIMARY KEY(MONUM)  
);

SELECT * FROM MOVIE;

SELECT MONUM, MOPIC, MOTITLE FROM MOVIE 
ORDER BY MONUM DESC;


DESC MOVIE;

--****************************************

-- ���� ���̺� (MOR)
CREATE TABLE MOVIEREVIEW(
    MORMONUM        NUMBER,                  -- ��ȭ��ȣ (�ܷ�Ű)
    MORNUM          NUMBER,                  -- �����ȣ (�⺻Ű)
    MORID           NVARCHAR2 (10),          -- ���̵� (�ܷ�Ű)
    MORCONTENTS     NVARCHAR2(100),          -- ���� 
    MORSTAR         NVARCHAR2(5),            -- ����
    CONSTRAINT MORNUM_PK PRIMARY KEY(MORNUM),
    FOREIGN KEY(MORID) REFERENCES MOMEMBER(MOMID),
    FOREIGN KEY(MORMONUM) REFERENCES MOVIE(MONUM)
);

SELECT * FROM MOVIEREVIEW;

--****************************************

-- �� ���̺� (MOS)
CREATE TABLE MOVIESAVE (
    MOSID       NVARCHAR2(10) ,                 -- ���̵� (�ܷ�Ű)
    MOSNUM      NUMBER ,                 -- ��ȭ��ȣ (�ܷ�Ű)
    
    FOREIGN KEY(MOSID) REFERENCES MOMEMBER(MOMID),
    FOREIGN KEY(MOSNUM) REFERENCES MOVIE(MONUM),
    
    CONSTRAINT MOSAVE_PK PRIMARY KEY (MOSID,MOSNUM)
);

SELECT * FROM MOVIESAVE;

--****************************************
-- ������ �� ��
-- ������ (�����ȣ) + ĳ������ / (��ȭ��ȣ) + ĳ������
-- VIEW (��) ���� : ȸ������Ʈ, ��ȭ����Ʈ

--****************************************
-- ������
-- MOVIE_SEQ (��ȭ��ȣ) ������ �����
CREATE SEQUENCE MOVIE_SEQ START WITH 38 INCREMENT BY 1;

-- MORNUM_SEQ (�����ȣ) ������ �����
CREATE SEQUENCE MORNUM_SEQ START WITH 1 INCREMENT BY 1;

-- ������ ��ȸ
SELECT * FROM USER_SEQUENCES;

-- ĳ�� ������
ALTER SEQUENCE MOVIE_SEQ NOCACHE;
ALTER SEQUENCE MORNUM_SEQ NOCACHE;

--****************************************
-- ��
-- (MOVIELIST) ��ȭ �����ڿ� ����Ʈ VIEW ����
CREATE VIEW MOVIELIST AS
            SELECT MOVIE.*, ROW_NUMBER() OVER(ORDER BY MONUM DESC) AS RN
            FROM MOVIE;
            
SELECT * FROM MOVIELIST;

-- (MOMLIST) ȸ�� �����ڿ� ����Ʈ VIEW ����
CREATE VIEW MOMLIST AS
            SELECT MOMEMBER.*, ROW_NUMBER() OVER(ORDER BY MOMNAME ASC) AS RN
            FROM MOMEMBER;

SELECT * FROM MOMLIST;


------------------------------------------------------------------------------------------------------------
--ȸ�� ����

Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('admin','112233AA!','������',to_date('97/01/01','RR/MM/DD'),'����','admin@naver.com','010-1234-5678',0,null);
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('aaaa','112233aa*','ȸ��1',to_date('95/02/08','RR/MM/DD'),'����','aaaa@naver.com','010-1111-5678',5000,to_date('21/04/12','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('bbbb','112233bb*','ȸ��2',to_date('96/04/28','RR/MM/DD'),'����','bbbb@naver.com','010-2222-5678',100,to_date('21/03/20','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('cccc','112233cc*','ȸ��3',to_date('98/10/24','RR/MM/DD'),'����','cccc@naver.com','010-3333-5678',0,null);
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('dddd','112233dd*','ȸ��4',to_date('97/11/29','RR/MM/DD'),'����','dddd@naver.com','010-4444-5678',1100,to_date('21/03/28','RR/MM/DD'));
Insert into MOMEMBER (MOMID,MOMPW,MOMNAME,MOMBIRTH,MOMGENDER,MOMEMAIL,MOMPHONE,MOMMONEY,MOMSUB) values ('eeee','112233ee*','ȸ��5',to_date('97/06/11','RR/MM/DD'),'����','eeee@naver.com','010-5555-5678',100,to_date('21/03/21','RR/MM/DD'));

--��ȭ ����
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (1,'�λ���','�λ���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/UOTOjA0ngmk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����̹��� �糭�� ���ѹα��� ��ģ��!
��ü�Ҹ��� ���̷����� �������� Ȯ��ǰ� ���ѹα� ����糭�溸���� ������ ���,
������ ���� ���� ������� �� �ϳ��� ������ ���� �λ����
��ư��� ���� ġ���� ������ ���̰� �ȴ�.
���￡�� �λ������ �Ÿ� 442KM
��Ű�� ����, ���Ѿ߸� �ϴ� ������� ������ ����!','118��','�׼�',to_date('16/07/20','RR/MM/DD'),'����, ������, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (2,'���׶�','���׶�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/hcKp68DtBb0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�� �� ���� ���� ������ ���� ���� �ൿ�� ������ö��(Ȳ����),
20�� ����� �ºλ� �������塯(���޼�), ���� ���� ȫ���� ���̽�����(������), ��ü�� �������硯(����ȯ), ���� �������硯(�����)���� �� ����, �� ��� �� ����, �� �ִ� �� ���� Ư�� ���»�� ��� ���������.
�������� �Ѵ� ���� ���˸� �ذ��� �� ���� �������� ����, ����ö�� ��� 3�� �����¿���(������)�� ������ �ȴ�.
���׶� ��������� VS ���Ƶ��� ��� 3��
2015�� ����, �������� �� ���� ����� ���۵ȴ�!','123�� ','�׼�',to_date('15/08/05','RR/MM/DD'),'Ȳ����, ������, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (3,'��������','��������.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/xM1CIQd_X4c" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','������ ġŲ���! �㿡�� �ẹ�ٹ�!
���ݱ��� �̷� ����� ������!
��ö�־� �޸��� �������� ������ �ٴ�, �ޱ�� ��ü ���⸦ �´� �����!
�� �̻� ������ ���� ���� ���� ���� ������� ���� ���������� ���� ���� �й��� ��Ȳ�� �����ϰ� ������, ������, ��ȣ, ���Ʊ��� 4���� ������� �Բ� �ẹ ���翡 ������.','111��  ','�ڹ̵�',to_date('19/01/23','RR/MM/DD'),'���·�, ���ϴ�, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (5,'�','�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Ej25zrnaTXk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���� ������(��Ϲ��� ��)�� ��Ÿ�� �� �������� �ǹ��� ���� ��ǵ�� ������ ��Ĭ ��������.
������ ���� �߻� ���� �ߵ����� ������ ����� �������� ��� ����� ������ �� ������ �����̶�� �ҹ��� �ǽ��� ������ �� ���� ���� ������.','156�� ','ȣ��',to_date('16/05/12','RR/MM/DD'),'������, Ȳ���� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (6,'���˵���','���˵���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/3DOZUhe2xWk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���ѹα��� ����� ����þ(����� ��)�� �ϴ��� ��� ���� ���� �ָ� �ѹ����� ������ ��ȭ�� ������ �� �������� ��������(������ ��)���� �ΰ��� ��ġ�� ����� ���� �����ϸ�(�ֱ�ȭ ��)�� ������ �̲��� ���¹��� ���� ����� �ѹ濡 ������� ��.¯.��.��. ������ ����µ���
�����ϰ�! ȭ���ϰ�! ����ϰ�!
���� ��� ������� ���¹� ������� ������������������ ���۵ȴ�!','121�� ','�׼�',to_date('17/10/03','RR/MM/DD'),'������, ����� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (7,'�ϻ�','�ϻ�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/RnGxpZ75zFU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1933�� ������ ����� �ô�
���ѹα� �ӽ����δ� �Ϻ� ���� ������� ���� �� ���� �ϻ������� �����Ѵ�. �ѱ� ������ ���ݼ� �ȿ���, ���﹫���б� ��� �ӻ���, ��ź ������ Ȳ����! �豸�� ���Ϳ� ������ �޴� �ӽ����� �湫�� ���� �������� �̵��� ã�� ������ �����Ѵ�. �ϻ���� Ÿ���� �����ֵб� ��ɰ� ī�ͱ�ġ ������ ģ���� ���α�. ����, ���������� �ž��� �Ƿڸ� ���� û�λ��ξ��� �Ͽ��� �ǽ����� �ϻ���� �ڸ� �Ѵµ�...
ģ���� �ϻ������� �ѷ��� �̵��� ������ �� ���� ����� ��������!','139��','�׼�',to_date('15/07/22','RR/MM/DD'),'������, ������, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (8,'�����Z','�����Z.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/BsmDoCph6eI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�� ���� �̻� ����� �Ŵ��� ������ ���۵ȴ�!
�ǹ��� �װ��� ����, ������ �Ա� ���� ����, ���漱�� �ѷ��� ���� ��,
���� �������� ������ �� �� ���� �̺��� �Ͼ�� �����Ѵ�.
�׸��� ��ü�Ҹ� ������� �������� �������� ���ô� ���İ��� �Ƽ��������� ���Ѵ�.','115�� ','ȣ��',to_date('13/06/20','RR/MM/DD'),'�귡�� ��Ʈ, �̷��� ���뽺 ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (9,'�̵峪�� ��','�̵峪�� ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IgyknlJ79kM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','XP(���Ҽ�������)��� ��ͺ����� �¾��� ���ؾ߸� �ϴ� ����Ƽ.
���� �㿡�� ������ ����� �׳࿡�Դ� ��Ӵϰ� ������ ��Ÿ�� â�� �ʸӷ� 10��° ¦����ؿ� ���������� ������ ���̴�.
��� �� ���� ���������� �ѹ��� ����ŷ�� �ϴ� ������Ƽ���� �տ� ���������� ��Ÿ����, �� ����� ���� �㸶�� ��ΰ� �η����ϴ� �Ϻ��� ����Ʈ�� �̾��.
ó������ �Բ� ������ ���� ��, �� ���� �ð��� ������ ������Ƽ���� �׸� ���Ѿ߸� �ϴ� ��Ģ�� ���� �ǰ� �ᱹ ���� �� ���� ������ �ؾ߸� �ϴµ���
�ʿ��� �ϰ� ���� ��¥ ��� ���
�¾��� �� �ڿ��� �� �翡 �־��ٷ�?','92�� ','�θǽ�',to_date('18/06/21','RR/MM/DD'),'���� ��, ��Ʈ�� �������װ� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (10,'�μ���','�μ���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/hx1fqhNoH8A" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','Ÿ���� �޿� �� ������ ��ġ�� Ư�� ���ȿ�� �ں�.
�׸� �̿��� ���̹� ����� ������ �������� �ϴ� ������� �ں꿡�� ������ ��ġ�� ���� �ƴ�, ������ �ɴ� ���μ��ǡ� ������ �����Ѵ�.
���� �������� �������� �����ڰ� �Ǿ��ִ� �ں��� �ź��� �ٲ��ְڴٴ� �ź��� �� ���� ������ �ϰ�, ����ϴ� ���̵鿡�� ���ư��� ���� �� ������ �޾Ƶ��δ�. �ְ��� ���� ����, ǥ���� �Ǽſ��� �����ؼ� ���μ��ǡ� ������ ���������� ����ġ ���� ��ǵ�� �����ϰ� �Ǵµ���','147�� ','�׼�',to_date('10/07/21','RR/MM/DD'),'���������� ��ī������, ��Ÿ���� �� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (11,'�������','�������.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/EQWqsdOjvG8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','������ ���, �Ŵ��� �̷η� �ѷ����� ���� ����
��� ����� ������ ä �ǹ��� ��ҷ� ������ ���丶����(���� ������̾�).
���丶������ �̷ο� ���� �װ����� �ڽŰ� ���� ��Ȳ�� ������� ������.
�׵��� ���� �� ��� �����̴� �̷ο��� ��ü�� �� �� ���� ������ ����� �븳�ϸ�, �������κ��� �������� Ż�ⱸ�� ������ �ϼ��� ������.
�׷��� ��� ��, �̷��� ���� ������ �׵��� ������ ������ ��ο� ���̰� �Ǵµ���','113�� ','�׼�',to_date('14/09/18','RR/MM/DD'),'���� ������̾�, ī�� ���ڵ��󸮿�, �丶�� ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (12,'��Ű��� : �ǿ��� �Ҳ�','��Ű���_�ǿ��� �Ҳ�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/9pfVCKaheGQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����� �� �ϳ�! ��� ������ ���߰�ȴ�!
���ڿ� ���ڸ� �����ϴ� �� ������ ����!
������ ��ȭ��ų �Ŵ��� ������ �Ҳ��� Ÿ������!
12���� �������� �̷���� ���籹�� ���ǿ����� ü�縦 �����ϱ� ���� ���� ���� ���� ����Ű��ӡ�. �ϳ⿡ �ѹ� �� �������� ��÷�� ���� �� ���� ����, �� 24���� ������ �ܷ�� �Ǵ� ��.','142��','�׼�',to_date('12/04/05','RR/MM/DD'),'������ �η���, ���� ��ó�� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (13,'�����̾�!2','�����̾�2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/q9B6pctppK4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�����谡 ����� �ְ��� ������ ��ȭ�� ���ƿ´�!
���λ��� ª�� ������ �о�. ���� �߾��� ����� �;�!��
���� ����(�޸� ��Ʈ��)�� ��� ���� ��� ȣ�� �簳���� �غ��ϸ� Ȧ�μ��⸦ ����� ����. �׳�� ������ ������ ģ�� Ÿ�Ŀ� ����, �׸��� ��������� �� �ƺ��� ��, �ظ�, ������ ������ ��Ƽ �ʴ����� ������.
���� ���Ǵ� ��Ƽ �غ� �� ������ ������ �����ߴ� �߾�� ����� �鿩�ٺ��� �ǰ�, ����� �մԱ��� �湮�ϴµ��� ���� �ѿ����� ��Ƽ�� ������ ���� �� ������?
 �������� �ڶ��������� �λ� �ְ��� ��Ƽ�� ���Կ�!��','114��','�θǽ�',to_date('18/08/08','RR/MM/DD'),'�޸� ��Ʈ��, �Ǿ ��ν���, �ݸ� �۽� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (14,'�н�����','�н�����.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/jnPm62HjYE8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���õ� �� ���, ����� ����� ���ؾ� �Ѵ�!
120�� ���� ��ô �༺���� ������ ��ȣȭ ���ּ� �ƹ߷� ȣ. 
���⿣ ���ο� ���� �޲ٴ� 5,258���� �°��� Ÿ�� �ִ�. 
�׷��� �� �� ���� ������ ���� �� ��������(ũ���� ����)�� ���ζ� ����(������ �η���)�� 90���̳� ���� ���� ���¿��� ����� �ȴ�.
������ ���θ� �����ϰ� �Ǵ� �� ����� ���ּ��� ġ������ ������ �ִٴ� ����� �߰��ϰ� �ǰ�, ��ħ�� �׵��� ���麸�� ���� ��� ������ ���ݰ� �Ǵµ���','116�� ','SF',to_date('17/01/04','RR/MM/DD'),'������ �η���, ũ���� ���� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (15,'���� ����','���� ����.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/xfvxK19CqQw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����ִ� ��� ���� �е��� �׵��� �����!
������ �������� ���� ���� �� 22��, ������ �������� ź���� ������� �ռ��� ������ ���塯�� ���� �ִ��� �׸���ũ�� �ڸ���´�.
������ ���Ӱ� �¾ ���̺긮�� ������� ���ɰ� ���ݼ��� ������ ��ȭ��Ű�� �ΰ��� ������ ����� �����ϴµ��� 
���ƿ� ������ ����! �η����� ��ģ �־��� ����!','125�� ','�׼�',to_date('15/06/11','RR/MM/DD'),'ũ���� ����, ����̽� �޶� �Ͽ��� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (16,'Ȥ��Ż�� : ��ȭ�� ����','Ȥ��Ż��_��ȭ�� ����.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IU2J6u5-MS0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','��ȭ�� �η��� �����ϴ� �����̴�!
������ ���� �ε常(���ӽ� ������ ��)���� �������̸� ���� �ɸ� �ƹ���(�� ������ ��)�� ġ���ϰ��� �ΰ��� �ջ�� ������� ȸ�������ִ� ��ť��� �����Ѵ�. �� ���� �ӻ�������� ���ο����� �̿�ǰ�, �� ���ο����Լ� � ������(�ص� ��Ű�� ��)���� �¾ �������� �ڽ� ������ ���������� Ű��� �ȴ�. �������� ��� �ִ� ���� ����, �ð��� �������� ���������� ������ �ΰ��� �ɰ��ϰ� �ȴ�. �׷��� ��� ��, ���������� �̿��� ���ڿ� �ú� ���� �������� �ƹ����� ���������� ��ȣ�Ϸ��� �������� �ΰ��� �����ϰ� �ǰ�, �ᱹ ���ο����� ��ȣ�ϴ� �ü��� �������� �ȴ�. �װ����� �ڽ��� �ΰ��� �ٸ� ������ ���� ������ �ڰ��ϰ� �ǰ� �ΰ��� ���ο��� ��� ���ϴ��� ���� �� ���������� �ٸ� ���ο���� �Բ� ������ �ɰ� �ΰ������ �������� ����ϴµ�����','106��','SF',to_date('11/08/17','RR/MM/DD'),'���ӽ� ������, ������ ����, �ص� ��Ű�� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (17,'���� �ҳ�ô�','���� �ҳ�ô�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/TgH9V75cNtI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����, �� ������ �߾��� �Ǿ��༭
���ư��� ���� �������(?) ����� ���� �濪��(!)
1994�� ��å ���� �밨�ߴ� �������, ����ȭ ������ ���� ����� �ҳ� �������š��� �б��� �ָ���� ����� �ҳ� ����Ÿ�������� ù��� �о��ֱ� ����','134��','�θǽ�',to_date('16/05/11','RR/MM/DD'),'�ۿ�ȭ, �մ��, �̿��� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (18,'�����а���','�����а���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/PxfE7MUQB2g" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','��¼�顦����� �� ������? �����а��� �������� �׳ฦ ó�� ������.
���� ��ġ���� ���� ���� ���� ��, �����а� �¹��� ''�����а���'' �������� ó�� ���� ����� �������� ���Ѵ�. 
�Բ� ������ �ϰ� �Ǹ鼭 ���� ������ ���� ģ��������, �ڽ��� ������ ǥ���ϴ� �� ���� ������ �¹��� �� �ۿ� �� �� ������ ����� ���� �ӿ� ǰ�� ä ���� ���ط� ���� ������ �־����� �ȴ�. ��¼�� �ٽá������ �� ������? 15�� ���� �׳ฦ �ٽ� ������','118�� ','�θǽ�',to_date('12/03/22','RR/MM/DD'),'���¿�, �Ѱ���, ������, ���� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (19,'��Ƽ�λ��̵�','��Ƽ�λ��̵�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/ESPFTY8Y-xM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����, ����, ����, ����.. ������ �ܱ��α���! �ڰ� �Ͼ�� ���� �ٸ� ������� ���ϴ� ����, ��������.
�׿��� ó������ ����� ���ϰ� ���� �� �� ����� �����.
���� D-DAY! ���������� �׳࿡�� �ڽ��� ������ ����ϱ�� �ϴµ���
���ʹ��� ���ƿ�? ������ũ�� ���ƿ�?
���.. ���� ��û ���� �߾��.
���� �� �����̶� �� �԰� �;����','127�� ','�θǽ�',to_date('15/08/20','RR/MM/DD'),'��ȿ��, ����, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (20,'������2','������2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/X1awKDMbw34" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1977�� ���� ���ʵ�. ���� ���� �� ���Ű� ��� �ִ� ������ ���� ��ü�� �� �� ���� ���簡 ��Ÿ����. 
�ϸ� ���Ͱ��̽�Ʈ ����. ���� �ε帮�� �Ҹ�, ����� ��Ҹ�, ������ �㸶�� ������ ���ǵ�, ������ ���̵���� ���߿� ���� �� ������ �ϵ��� ����Ų��. �ᱹ ��ȸ�� ��û�� ���� ���� �κΰ� ���� ���ʵ��� ���� ã�ư� ����� �����Ѵ�. �׷��� ���� �κδ� �� ������ ���󺸴� ���� ��û�� ��븦 ������ �ǰ�, ���� �κ��� ������� �����޴µ���','134��','ȣ��',to_date('16/06/09','RR/MM/DD'),'���� �Ĺ̰�, ��Ʈ�� ����, ����ī ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (21,'��Ű','��Ű.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/6RUSZWD0JHc" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','��Ȥ�� ų�� ����(������)�� ��� ó�� �� �쿬�� �鸥 ��������� �񴩸� ��� �Ѿ��� ������ ����� �Ұ� �ȴ�. 
�α⵵, ���� �ǿ嵵 ���� �ױ�� ����� ������ �缺(����)�� �ź� ������ ���� �鸥 ��������� �׷� ������ ���� �ǰ�, �ڽŰ� ���� ����� Ű�� �ٲ� ����ģ��. ���� ������ �ڽ��� �缺�̶�� ������ ä, ���� �����ϱ� ���� ����ϴµ��� 
�λ��� �� �ѹ� ã�ƿ� �ʴ��� ��ȸ! ��Ư�� ����! �̰��� LUCK.KEY��!','112��','�ڹ̵�',to_date('16/10/13','RR/MM/DD'),'������, ����, ������, ������ ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (22,'�Ͽ��� �����̴� ��','�Ͽ��� �����̴� ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/YpqMZt1gOXU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','��� ��, ������ �� ä ������ ���ַ� ���� �ҸӴϰ� �� �ҳ� ''����'' ���� �ӿ��� ���� �ȴٰ� �Ŵ��� ������ ���� ���� �ȴ�. 
�װ����� �ڽŰ� ������ �Ͽ��� ����� ���ָ� ���ָ� Ǯ���ְڴٴ� �ҲɾǸ� Ķ������ ������ �ް� û�Һΰ� �Ǿ� �������̴� ������ �ӹ��� �Ǵµ���','119��','�ִϸ��̼�',to_date('04/12/24','RR/MM/DD'),'���̼� ġ����, �⹫�� Ÿ��� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (23,'��Ʈ����','��Ʈ����.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/9mn4seqI8Vs" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�ΰ��� ��︶�� AI�� ���� �Էµǰ� ���� �Ǵ� ����.
��¥���� �� ��¥ ���� ���� ���� ����Ʈ������ �� �ӿ��� ������ ������ �ν��� �� ���� ���Ǵ� �ΰ���. 
�� ����Ʈ�������� ���� �����鼭 AI���� ���� ������ �ι��� �� ''���Ǿ���� �ڽŰ� �Բ� �η��� ���� ������ ���� ���ס��� ã�� ��Ǵ�. 
��ħ�� �����Ǿ���� ������ ����� ȸ�������, �㿡�� ��Ŀ�� Ȱ���ϴ� û�� ���׿����� ���ס��� �����ϴµ��� 
�޿��� ��� �ڵ�, ���� �׵��� ����� ���ο� ������ ������!','136��','SF',to_date('99/05/15','RR/MM/DD'),'Ű�ƴ� ���꽺, �η��� �ǽù�, ĳ�� �� �� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (24,'�͹̳�����2 : ��������','�͹̳�����2_��������.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Bxx7-sPKt84" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�̷�, �η��� ����� ������ ��� �Ǵ� ��� ��ī�̳��� �η� ���ױ� ��ɰ� �� �ڳʸ� ���ֱ� ���� 
��ü �ݼ��� �κ��� T-1000�� ������ � �� �ڳʿ��Է� ������. 
�̷��� �η� ����� �� � �� �ڳ�. 
��ī�̳��� T-1000�� ��ħ���� �� ���� �߰��� �����ϴµ���','137��','SF',to_date('91/07/06','RR/MM/DD'),'�Ƴ�� �������װ�, ���� �ع���, ������� �޷� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (25,'���� �̸���','���� �̸���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/enRm-9qF2L8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���� ���� �� ���� �ʸ�, ã�� �־� õ�� ���� �ٰ����� ���� ������ ���۵ȴ�. ���쿡 ��� �ҳ� ��ŸŰ���� �ð� ��� �ҳ� �������ϡ��� ������ ���� �ڹٲ�� �ű��� ���� �۴�. ���� ����, ���� ģ����, ���� ǳ���... �ݺ��Ǵ� �ް� �귯���� �ð� ��, ��ħ�� ���ݴ´�. �츮, ���� �ڹٲ� �ž�? ���� ���� �� ���� �� ��� �ݵ�� ������ �ϴ� ����� �Ǵ� ���ο��� ���� �޸� Ȯ���ϸ� ���� ģ���� �Ǿ�� ��ŸŰ���� �������ϡ� !
�������ϰ� �� �̻� ���� �ٲ��� ���� �ڽŵ��� Ư���ϰ� �̾����־����� ������ ��ŸŰ���� �������ϡ��� ������ ���µ�... 
�ذ� ���� ���� ��� ������ �� �Ǵ� ��� ���� �̸���?','106��','�ִϸ��̼�',to_date('18/01/04','RR/MM/DD'),'ī��Ű ���뽺��, ī�̽ö��̽� ��� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (26,'�ź��� ��������','�ź��� ��������.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/IbfT6qVkll8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','����Ʈ ��ĳ�Ǵ���(���� �������)�� Ȱ������ ������ ����� ������ ���ַ�Ʈ �׸����е塯(���� ��)�� �����߱� ������ MACUSA�� ����������, 
�̳� ����ߴ� ��� Ż���� �����ڸ� ������ �����Ѵ�. 
���� �������� ������ ��� ������ ������� �ʴ� ������� �����Ϸ��� �׸����е��� �߿��� ���� ���� ���˹��� �����(�ֵ� ��)�� ���ڿ��� ��Ʈ���� ������ ��û�Ѵ�. 
������ ��ȸ�� ���� �� �п��Ǿ� ���� ���, �ճ��� ������ ���� ���� ä ��Ʈ�� �̸� �³��ϴµ���','134��','��Ÿ��',to_date('18/11/14','RR/MM/DD'),'�ֵ� �������, ���� ��, ĳ���� ���ͽ��� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (27,'��ٿ� Ÿ��','��ٿ� Ÿ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/tnyWkyDGWuM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���¼ַ� ��(���� �۸���)�� ������ �� ��, �ƹ���(�� ����)�κ��� ������� ������ ����� ��� �ȴ�. �ٷ� �ð��� �ǵ��� �� �ִ� �ɷ��� �ִٴ� ��! �װ��� ��� ��Ʋ���� ���̰ų� ���Ű� �߰ſ� ����� �� ���� ������, ����ģ���� ����� �� �� ������.. 
���� ���� �������� �� ���� �쿬�� ���� ��������� ���� �޸����� ù���� ���ϰ� �ȴ�. �׳��� ����� ��� ���� �ڽ��� Ư���� �ɷ��� ������ �����ϴ� ��. ��� ���, ����� ������ �����ε�! �߰ſ��� ���� ���� �̰߰� ���÷���! �޿� �׸��� �׳�� ���ϸ��� �ְ��� ������ ������. ������ �׿� �׳��� ����� �Ϻ��������� ���� �ѷ��� �ֺ� ��Ȳ���� �̹��ϰ� ��������, ����ġ ���� ��ǵ��� �������� ��Ÿ���� �����ϴµ��� 
��� ������ �ٽ� ��� �ȴٸ�, ���� �Ϻ��� ����� �̷� �� ������?','123��','�θǽ�',to_date('13/12/05','RR/MM/DD'),'���� �۸���, ����ÿ �ƾƴ㽺 ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (28,'�Ǹ��� ����ٸ� �Դ´�','�Ǹ��� ����ٸ� �Դ´�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/2wnvmS1A7O8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�ְ��� �м� �Ű��� �������̡��� ���� ���� �Ի������� ���ص帮�ơ�(�� �ؼ�����)���� �� ȭ���� ���谡 ���� �����⸸ �ϴ�.
 ������ ���� ���θ���Ʈ�� �Ǳ� ���� �� 1�⸸ ��Ƽ��� ��������� �Ǹ� ���� ����, �������̡� ������ ���̶��١�(�޸� ��Ʈ��)�� ���ϴ� ���� ���� ���� ��������!!
24�ð� ������ �޴���, ����ģ�� ���ϵ� ì���� ���� ������ Ǯ �߱�,
 ������ �׳��� �ֵ��� ���� ��������! �ް��� ���� �־�����.. ���� ���� �ޱ��� �񼭰� �� ''�ص帮��''! ���õ� ���̶��١��� Į ���� ��Ÿ�� �Ұ����� ���̴� �̼ǿ� �������ϴ� ���ص帮�ơ�
����, ���� ���� �̰����� ��ƿ �� ������?','109�� ','�ڹ̵�',to_date('06/10/25','RR/MM/DD'),'�޸� ��Ʈ��, �� �ؼ����� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (29,'��Ǭ��','��Ǭ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/ow9woC6-9Q8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','������ ������ ������ ����(?)�� ���۵ȴ�
�õ庸�̵� �� �ߵ��� ����18���� ž �ȿ����� ���� ���⸸���� �ҳ� ��Ǭ��. ��� �� �ڽ��� ž�� ħ���� �ձ� �ְ��� �뵵�� �ѹ濡 ������´�. �׸��� �׸� ������ �޿��� �׸��� ���������� ������ �����Ѵ�. 
���׺�ȣ ��ģ�� �������� ������ �賭�� �����θ� ����ϴ� ��Ǭ��. 
�׷� �׳� �տ� ���� �� �� �ս� ��� �ƽøӽ��� �߰�, ���̴����� ������ Į���� ���� ���º��� ������ ����, ��Ǭ���� ��¥ ���� ���� ������ ���� ���� ������ ���� ���� ��������� ��ǵ��� ������ �����Ѵ�. �׷��� ������ ������ �츮�� ��Ǭ���� �ڽ� �տ� ������ ���� ��ġ�� ������ ���� ���µ�...','100��','�ִϸ��̼�',to_date('11/02/10','RR/MM/DD'),'�ǵ� ����, ��Ŀ�� ���� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (30,'���ͽ��ڶ�','���ͽ��ڶ�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/d2VN6NNa9BE" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���츰 ���� ã�� �ž�, �� �׷����̡�
���� ������ ���ο� ������ ������ �ر��� �̷��� �ٰ��´�.
 ���� 20���⿡ ���� �߸��� �� �������� �ķ� ������ �ҷ��԰�, NASA�� ��ü�Ǿ���. �̶� �ð����� �Ұ������� ƴ�� ������, ���� �ڵ鿡�Դ� �� ���� Ž���� �η��� ���ؾ� �ϴ� �ӹ��� ��������. ����ϴ� �������� �ڷ� �� ä �η���� �� ū ������ ����, �׵��� ���� ����� ã�� ���ַ� ����. �׸��� �츰 ���� ã�� ���̴�. �� �׷����̡�','169�� ','SF',to_date('14/11/06','RR/MM/DD'),'��Ʃ ��Ŀ����, �� �ؼ����� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (31,'���� ���丮4','���̽��丮4.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/u8GQibRXVHg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�츮�� ������ ���� ������ �ʾҴ�!
�峭���� ����� �ź��ϰ� ���� �� ģ�� ����Ű���� ã�� ���� �� ���� ���� ����𡯴� �쿬�� ���� ģ�� �����̡��� ������ �׳ฦ ���� ���ο� ���� ���� �߰� �ȴ�. ����, ������� ģ������ ����� ����𡯿� ����Ű���� ã�� ���� �� ����õ���� ������ ������ �Ǵµ���','100�� ','�ִϸ��̼�',to_date('19/06/20','RR/MM/DD'),'�� ��ũ��, �� �˷� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (32,'�ظ����Ϳ� �������� ��','�ظ����Ϳ� �������� ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/524LTjLx9x0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','11�� ������ ��ĥ �յ� ��� �� �ظ����� �ʷϻ� ��ũ�� ������ �� ���� ������ ��޵ȴ�. �� ������ ������ �ٸ� �ƴ� �ظ��� 11�� ������ �����Ͽ� �������Ρ�ȣ�׿�Ʈ �����б������� ���� �����ʴ����̾���. 
�׸��� �ظ��� ������ �����Ϸ� �� ���� �ر׸���� �ظ��� �𸣰� �־��� �ظ��� ������ ��ü�� �˷��ִµ�. 
�װ��� �ٷ� �ظ��� ������ �ɷ��� ���� �������� ��!
������ ŷ��ũ�ν� ���� �ִ� ����� 9�� 3/4 �����忡�� ȣ�׿�Ʈ Ư�޿����� ź �ظ��� ���� �ȿ��� ���� ȣ�׿�Ʈ �����б� ���л��� �츣�̿´� �׷������� �� ���񸮸� ���� ģ���� �ȴ�. 
�̵�� �Բ� ȣ�׿�Ʈ�� ������ �ظ���, ���� ������ ���踦 �����ϸ� ������ �ű��� �������� ��� ������.','152�� ','��Ÿ��',to_date('01/12/14','RR/MM/DD'),'�ٴϿ� ����Ŭ����, ����Ʈ �׸�Ʈ, ���� �ӽ� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (33,'�ظ����Ϳ� ����� ��','�ظ����Ϳ� ����� ��.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/5s8hdouZmG8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','1�г� �� �ظ��� ������ �������� Ȱ����� �б� ��ü�� �ҹ��� ����, �� ���� �ظ��� ��ġ �ʴ� ������ ������ �ȴ�. ���� ������ ����, �����۰� ������ �ݸ� ũ���� ���� ���Ի��� ����� ���� ������ ����ġ�� ���� ���� �������� ����Ʈ�� ���Ӱ� �ظ������� ���� �ȴ�.
���� �ü� ���⸦ �����ϴ� �߳�ô�ϴ� ���� ſ�� �ֺ����� ������ ���ϴ� ����Ʈ ������ �ظ��� ģ������ �;� �ȴ�������, �� ���� �б����� �Ͼ�� ������ ��ǿ� ���� ������ ������ �����ش�. 
��� �̸��� �ظ����� ���ߵǰ�, �ᱹ �޿���� �ظ��� �ǽ��ϱ⿡ �̸���. ���� �а� �츣�̿´�, �׸��� ���������� �ϱ��忡 ������ ���� ���� ���� ���ϸ��� ������ �ظ��� �ϴ´�.
�ڽ��� �ϴ� ģ������ �Ǹ���ų ���� ���� ��. 
�ظ��� -������ �شٸ� �Ƿ� �ɸ��� ��� ����Ʈ ������ �ټ� ���ذ� �Ǳ� ������- ����� ���°� �¼� �ο� ����� �ϴµ�..','162�� ','��Ÿ��',to_date('02/12/13','RR/MM/DD'),'�ٴϿ� ����Ŭ����, ����Ʈ �׸�Ʈ, ���� �ӽ� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (34,'����� : �������','�����_�������.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Ko2NWhXI9e8" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','���Ǵ�Ƽ �� ���� ���ݸ� ��Ƴ��� ����
������ ����� �� �����
���� ���� �׵��� ���� ��� ���� �ɾ���!
������ �����
����� �ٲ� ������ ������ ��������!','181�� ','�׼�',to_date('19/04/24','RR/MM/DD'),'�ι�Ʈ �ٿ�� �ִϾ�, ũ���� ���ݽ�, ũ���� �𽺿�����');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (35,'�ܿ�ձ�2','�ܿ�ձ�2.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/eSEs4B4H-EA" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�� ������ ���� ��� ������?
���� �θ��� �� ��Ҹ��� ������?
��� �� ���ϰ� �ǹ��� ��Ҹ��� ���縦 �θ���, ��ȭ�ο� �Ʒ��� �ձ��� �����Ѵ�. Ʈ���� ��� ���� ���ſ��� ���۵Ǿ����� �˷��ָ� ������ ���� ��а� ������ ã�� �������Ѵٰ� �����Ѵ�.
���迡 ���� �Ʒ��� �ձ��� ���ؾ߸� �ϴ� ����� �ȳ��� ������ ������ ������ ã�� ũ��������, �ö��� �׸��� ������ �Բ� ����õ���� ���� ������ ������ �ȴ�. �ڽ��� ���� �η����ߴ� ����� ���� �� ������ ���ĳ����⿡ �ڽ��� ���� ����ϴٰ� �Ͼ�߸� �ϴµ���
�η����� ���� ���ο� ����� ������!','103�� ','�ִϸ��̼�',to_date('19/11/21','RR/MM/DD'),'ũ����ƾ ��, �̵� ���� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (36,'Ʈ���϶���','Ʈ���϶���.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/PxuedpqCF2o" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','�������� ������ ������ ���� �װ� �´�!
17���� ����� ����л� �ҳ� �����󡯴� ���� �������� ������ �� ��ũ���� �ִ� �ƺ��� ������ �̻縦 �´�. ���� ù��, �����󡯴� �ô������� �ڽ��� ���� ������ų ������ �߻��� ��������塯�� ����ġ��, ������ �η��� ��ġ�� �λ��� ��ȯ�� �����Ѵ�. ��������塯�� ����ų �� ���� ����� ������ ������. ������ ��������塯�� ���� ������ �����̾� �����̶�� ����� �˰� �ǰ�, ����ġ ���� ��� �������.','121��','�θǽ�',to_date('08/12/10','RR/MM/DD'),'ũ����ƾ ��Ʃ��Ʈ, �ι�Ʈ ��ƾ�� ��');
Insert into MOVIE (MONUM,MOTITLE,MOPIC,MOURL,MOCONTENTS,MOTIME,MOGENRE,MODATE,MOACT) values (37,'��󷣵�','��󷣵�.jpg','<iframe width="560" height="315" src="https://www.youtube.com/embed/Dt5hFexM5BI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>','ȲȦ�� ���, ������ ���, �ݷ��� ������
�� ������ ��� ������ �����Ѵ�!
���� �ٴ� ������� ���� ������ ���� ����󷣵塯.
���� �ǾƴϽ�Ʈ �����ٽ�����(���̾� ����)�� ��� ������ ���̾ơ�(���� ����), �λ����� ���� ������ ���� ���� �� ����� �̿ϼ��� ������ ���븦 ������ �����Ѵ�.','127��','�θǽ�',to_date('16/12/07','RR/MM/DD'),'���̾� ����, ���� ���� ��');





--���� ����

Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,1,'aaaa','ù ���ۺ��� �������� ������� �ղ��� �� ���� ����.','5��');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,2,'dddd','������ ���� �����ְ� Ű������ ������ ���� �����ϴ� �ְ��� ������!!!','4��');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,5,'aaaa','��ȭ ������ 5���� ������ ������ �����ϴ�...','4��');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,4,'bbbb','���� ������ ���� �������̰� ���� ����̶� OST �ʹ� ���ƿ�Ф� ��¥ �λ���ȭ�Դϴ�','5��');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,6,'eeee','�� �ʹ� �����ϰ� ��̾������...','1��');
Insert into MOVIEREVIEW (MORMONUM,MORNUM,MORID,MORCONTENTS,MORSTAR) values (37,8,'dddd','�������� ��ȭ! ��վ����','4��');






COMMIT;

SELECT * FROM MOMEMBER;

SELECT * FROM MOVIEREVIEW;

SELECT * FROM MOVIE;

SELECT * FROM MOVIESAVE;

