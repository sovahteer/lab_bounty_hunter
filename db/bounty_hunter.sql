DROP TABLE bounty_list;

CREATE TABLE bounty_list (
  id serial8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty_value INT8,
  danger_level VARCHAR (255)
);

INSERT INTO bounty_list (name, species, bounty_value, danger_level)
       VALUES ('Spike Spiegel', 'Human', 10000, 'low');
INSERT INTO bounty_list (name, species, bounty_value, danger_level)
       VALUES ('Faye Valentine', 'Human', 225000, 'med');
INSERT INTO bounty_list (name, species, bounty_value, danger_level)
       VALUES ('Edward', 'Human', 1300000, 'high');
INSERT INTO bounty_list (name, species, bounty_value, danger_level)
       VALUES ('Jet Black', 'Human', 99999999, 'ermagherd');
