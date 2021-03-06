DROP TABLE IF EXISTS musician;
drop type if exists instrument;

create type instrument as enum('guitar', 'piano', 'drums', 'vocals');

CREATE TABLE musician (
  id serial primary key,
  name varchar(20),
  birth_date date,
  instrument instrument,
  bio text);

INSERT INTO musician(name, birth_date,
  instrument, bio) VALUES
('John Lennon', '1940/10/9', 'vocals',
'An iconic English 20th century
rock and roll songwriter and singer...'),
('Paul McCartney', '1942/6/18', 'piano',
'Sir James Paul McCartney 
is a popular Grammy Award-winning 
English artist...'),
('George Harrison', '1943/2/24', 'guitar',
'George Harrison was a popular English 
musician best known as a member of The Beatles...'),
('Ringo Star', '1940/7/7', 'drums',
'Richard Starkey, known by his stage name 
Ringo Starr, is an English popular musician,
singer, and actor, best known as the
drummer for The Beatles...');