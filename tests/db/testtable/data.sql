-- position
INSERT INTO position (name_) VALUES ('Директор');
INSERT INTO position (name_) VALUES ('Генеральный директор');
INSERT INTO position (name_) VALUES ('Заместитель генерального директора');
INSERT INTO position (name_) VALUES ('Главный инженер');

-- customer
INSERT INTO customer (name_) VALUES ('Боржоми');
INSERT INTO customer (name_) VALUES ('МАРС');
INSERT INTO customer (name_) VALUES ('Старатели');

-- currentspecnum
INSERT INTO currentspecnum (custname, nextspecnum) VALUES ('Старатели', 1);
INSERT INTO currentspecnum (custname, nextspecnum) VALUES ('Боржоми', 89);
INSERT INTO currentspecnum (custname, nextspecnum) VALUES ('МАРС', 123);

-- subsidiary
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('Старатели', 'Старатели', '26052023-001', '26.05.2023', 'Ершов А.С', 3);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('Боржоми', 'Чистая вода', '12082023-002', '12.08.2023', 'Петров П.Р.', 1);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('Боржоми', 'Святой источник', '12082023-002', '12.08.2023', 'Сидоров С.И.', 4);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('Боржоми', 'Эдельвейс', '12082023-002', '12.08.2023', 'Соловьев И.В.', 2);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('МАРС', 'Марс-Чердаклы', '12022012-001', '12.02.2012', 'Иванов И.И.', 2);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('МАРС', 'Марс-Мирный', '12022012-001', '12.02.2012', 'Иванов И.И.', 2);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('МАРС', 'Марс-Лужники', '12022012-001', '12.02.2012', 'Иванов И.И.', 2);
INSERT INTO subsidiary (custname, subsname, contractnum, contractdate, signer, signerposition) VALUES ('МАРС', 'Марс-Ситенка', '12022012-001', '12.02.2012', 'Иванов И.И.', 2);

-- spec
INSERT INTO spec (ordernum, nextspecnum, subsnam) VALUES ('102900', (SELECT nextspecnum FROM currentspecnum WHERE custname = 'Старатели'), 'Старатели');
INSERT INTO spec (ordernum, nextspecnum, subsnam) VALUES ('102901', (SELECT nextspecnum FROM currentspecnum WHERE custname = 'МАРС'), 'Марс-Чердаклы');
INSERT INTO spec (ordernum, nextspecnum, subsnam) VALUES ('102902', (SELECT nextspecnum FROM currentspecnum WHERE custname = 'МАРС'), 'Марс-Ситенка');


