DROP TABLE IF EXISTS position;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS currentspecnum;
DROP TABLE IF EXISTS leadtimeunit;
DROP TABLE IF EXISTS subsidiary;
DROP TABLE IF EXISTS spec;
DROP TABLE IF EXISTS productdata;
DROP TABLE IF EXISTS spectablescheme;

CREATE TABLE IF NOT EXISTS position (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS customer (
    name_ TEXT UNIQUE PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS currentspecnum (
    custname TEXT UNIQUE NOT NULL,
    nextspecnum INTEGER NOT NULL,
    FOREIGN KEY (custname) REFERENCES customer (name_)
);

CREATE TABLE IF NOT EXISTS leadtimeunit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name_ TEXT UNIQUE NOT NULL
);

INSERT INTO leadtimeunit (name_) VALUES ('Неделя');
INSERT INTO leadtimeunit (name_) VALUES ('Месяц');
INSERT INTO leadtimeunit (name_) VALUES ('День');

CREATE TABLE IF NOT EXISTS subsidiary (
    subsname TEXT UNIQUE PRIMARY KEY,
    custname TEXT NOT NULL,
    contractnum TEXT NOT NULL,
    contractdate DATE NOT NULL,
    signer TEXT NOT NULL,
    signerposition INTEGER NOT NULL,
    FOREIGN KEY (custname) REFERENCES customer (name_), -- ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (signerposition) REFERENCES position (id), --ON DELETE CASCADE ON UPDATE CASCADE, <<-- Parse error near line 6: no such table: main.leadtimeunit
    UNIQUE (subsname, custname)
);


CREATE TABLE IF NOT EXISTS spec (
    ordernum TEXT UNIQUE PRIMARY KEY,
    nextspecnum INTEGER NOT NULL,
    specdate DATE DEFAULT CURRENT_DATE,
    subsnam TEXT NOT NULL,
    FOREIGN KEY (subsnam) REFERENCES subsidiary (subsname), -- ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (ordernum, nextspecnum)
);

CREATE TABLE IF NOT EXISTS productdata (
    ordernum TEXT UNIQUE NOT NULL,
    article TEXT NOT NULL,
    descr TEXT NOT NULL,
    units TEXT NOT NULL,
    amount REAL NOT NULL,
    price REAL NOT NULL,
    leadtime INTEGER NOT NULL,
    leadtimeunitid INTEGER NOT NULL DEFAULT 1,
    FOREIGN KEY (ordernum) REFERENCES spec (ordernum), -- ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leadtimeunitid) REFERENCES leadtimeunit (id) -- ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE IF NOT EXISTS spectablescheme (
    ordernum TEXT UNIQUE NOT NULL,
    columnid INTEGER NOT NULL,
    columnname TEXT NOT NULL,
    columnformula TEXT NOT NULL,
    UNIQUE (ordernum, columnid)
);

PRAGMA foreign_keys = ON;