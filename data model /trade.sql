

CREATE  TABLE trade_project.`currency dimension` ( 
	currency_id          INT    NOT NULL   PRIMARY KEY,
	currencycode         CHAR(3)       
 ) engine=InnoDB;

CREATE  TABLE trade_project.product_dimension ( 
	product_id           INT    NOT NULL   PRIMARY KEY,
	inst_und_prod_typ    LONG VARCHAR       ,
	underlyingproduct    LONG VARCHAR       
 ) engine=InnoDB;

CREATE  TABLE trade_project.trade_facts ( 
	trade_id             INT    NOT NULL   PRIMARY KEY,
	tradedisplayprice    FLOAT       ,
	totaltradedquantity  BIGINT       ,
	tradequantity        BIGINT       ,
	hightradedisplayprice FLOAT       ,
	lowtradeddisplayprice FLOAT       ,
	level1askquantity    BIGINT       ,
	level1bidquantity    BIGINT       ,
	level1bidorder       BIGINT       ,
	level1askorder       BIGINT       ,
	tradeprice           FLOAT       ,
	hightradeprice       FLOAT       ,
	lowtradeprice        FLOAT       ,
	volume               BIGINT       ,
	date_id              INT       ,
	security_id          INT       ,
	exchange_id          INT       ,
	product_id           INT       ,
	currency_id          INT       ,
	level1biddisplayprice DECIMAL       ,
	level1askdisplayprice DECIMAL       ,
	level1askprice       DECIMAL       ,
	level1bidprice       DECIMAL       ,
	tradeflag            BOOLEAN       ,
	isuserdefinedinstrument BOOLEAN       ,
	impd_ind             BOOLEAN       ,
	CONSTRAINT unq_trade_facts_date_id UNIQUE ( date_id ) ,
	CONSTRAINT unq_trade_facts_security_id UNIQUE ( security_id ) ,
	CONSTRAINT unq_trade_facts_exchange_id UNIQUE ( exchange_id ) 
 ) engine=InnoDB;

CREATE  TABLE trade_project.date_dimension ( 
	date_id              INT    NOT NULL   PRIMARY KEY,
	tradedate            DATE       ,
	transacttime         TIME       ,
	maturitymonthyear    LONG VARCHAR       
 ) engine=InnoDB;

CREATE  TABLE trade_project.exchange_dimension ( 
	exchange_id          INT    NOT NULL   PRIMARY KEY,
	securityexchange     LONG VARCHAR       ,
	marketsegmentid      LONG VARCHAR       
 ) engine=InnoDB;

CREATE  TABLE trade_project.security_dimension ( 
	security_id          INT    NOT NULL   PRIMARY KEY,
	symbol               LONG VARCHAR       ,
	asset                LONG VARCHAR       ,
	securitytype         LONG VARCHAR       ,
	instrumentsequencenumber BIGINT       
 ) engine=InnoDB;

ALTER TABLE trade_project.date_dimension ADD CONSTRAINT fk_date_dimension_trade_facts FOREIGN KEY ( date_id ) REFERENCES trade_project.trade_facts( date_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE trade_project.exchange_dimension ADD CONSTRAINT fk_exchange_dimension_trade_facts FOREIGN KEY ( exchange_id ) REFERENCES trade_project.trade_facts( exchange_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE trade_project.security_dimension ADD CONSTRAINT fk_security_dimension_trade_facts FOREIGN KEY ( security_id ) REFERENCES trade_project.trade_facts( security_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE trade_project.trade_facts ADD CONSTRAINT fk_trade_facts_product_dimension FOREIGN KEY ( product_id ) REFERENCES trade_project.product_dimension( product_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE trade_project.trade_facts ADD CONSTRAINT `fk_trade_facts_currency dimension` FOREIGN KEY ( currency_id ) REFERENCES trade_project.`currency dimension`( currency_id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
