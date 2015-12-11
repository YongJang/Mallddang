CREATE TABLE member (
    num                 int(11)              NOT NULL  auto_increment,
    id                  varchar(15)          NOT NULL  ,
    passwd              varchar(15)          NOT NULL  ,
    name                varchar(15)          NULL      ,
    email               varchar(30)          NULL      ,   
    phone               varchar(15)          NULL      ,
    zipcode             varchar(7)           NULL      ,
    address             varchar(30)          NULL      ,
	regdate             date                 NULL      ,
    PRIMARY KEY ( num )
) charset=utf8;

CREATE TABLE board (
	num                 int(11)              NOT NULL  auto_increment  ,
	name                varchar(15)          NULL      ,
	email               varchar(30)          NULL      ,
	homepage            varchar(50)          NULL      ,
	subject             varchar(50)          NULL      ,
	content             text                 NULL      ,
	pos                 int(11)              NULL      ,
    ispos               int(11)              NULL      ,
	depth               smallint(5)          NULL      ,
	regdate             date                 NULL      ,
	pass                varchar(15)          NULL      ,
	count               smallint(5)          NULL      ,
	ip                  varchar(15)          NULL      ,
	PRIMARY KEY ( num )
)

CREATE TABLE good (
	num                 int(11)              NOT NULL  auto_increment  ,
	name                varchar(15)          NULL      ,
    quantity            int(11)              NULL      ,
	type                varchar(15)          NULL      ,
	region              varchar(15)          NULL      ,
    cost                int(11)              NULL      ,
    coupon              int(11)              NULL      ,
    rate                int(11)              NULL      ,
    regdate             date                 NULL      ,
	PRIMARY KEY ( num )
)

CREATE TABLE coupon (
	num                 int(11)              NOT NULL  auto_increment  ,
	name                varchar(15)          NULL      ,
    discount            int(11)              NULL      ,
	type                varchar(15)          NULL      ,
    regdate             date                 NULL      ,
    enddate             date                 NULL      ,
	PRIMARY KEY ( num )
)

CREATE TABLE log (
    num                 int(11)              NOT NULL  auto_increment,
    rfid                varchar(15)          NOT NULL  ,
    name                varchar(15)          NULL      ,
	started             varchar(15)                 NULL      ,
    ended               varchar(15)                NULL      ,
    store               varchar(15)          NULL      ,
    payment             int(11)              NULL      ,
    regdate             date                 NULL      ,
    PRIMARY KEY ( num )
) charset=euc-kr;
CREATE TABLE board (
	num                 int(11)              NOT NULL  auto_increment  ,
	name                varchar(15)          NULL      ,
	email               varchar(30)          NULL      ,
	homepage            varchar(50)          NULL      ,
	subject             varchar(50)          NULL      ,
	content             text                 NULL      ,
	pos                 int(11)              NULL      ,
    ispos               int(11)              NULL      ,
	depth               smallint(5)          NULL      ,
	regdate             date                 NULL      ,
	pass                varchar(15)          NULL      ,
	count               smallint(5)          NULL      ,
	ip                  varchar(15)          NULL      ,
	PRIMARY KEY ( num )
) ENGINE=InnoDB default charset=euc-kr;