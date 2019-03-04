drop table IF EXISTS users;
drop table IF EXISTS forums;
drop table IF EXISTS threads;
drop table IF EXISTS posts;

create TABLE  IF NOT EXISTS users(
	Id INTEGER PRIMARY KEY ASC, 
	username TEXT, 
	password TEXT
);

create TABLE IF NOT EXISTS forums(
	Id INTEGER PRIMARY KEY ASC, 
	forum_name TEXT, 
	forum_creator TEXT,
	FOREIGN KEY (forum_creator) REFERENCES users(username)
);

create TABLE IF NOT EXISTS threads(
	Id INTEGER PRIMARY KEY ASC,
	thread_title TEXT NOT NULL,
	thread_creator TEXT,
	thread_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	forum_Id INTEGER,
	FOREIGN KEY (forum_Id) REFERENCES forums(Id),
	FOREIGN KEY (thread_creator) REFERENCES users(username)
);

create TABLE IF NOT EXISTS posts(
	post_Id INTEGER PRIMARY KEY ASC,
	post_text TEXT NOT NULL,
	post_time DATETIME DEFAULT CURRENT_TIMESTAMP,
	post_authorId INTEGER,
	post_forumId INTEGER,
	post_threadId INTEGER,
	FOREIGN KEY (post_authorId) REFERENCES users(username)
	FOREIGN KEY (post_forumId) REFERENCES forum(Id)
	FOREIGN KEY (post_threadId) REFERENCES threads(Id)
);


insert into threads (thread_title, thread_creator, forum_id) values ('Does anyone know how to start Redis?', 'bob', 1);
insert into threads (thread_title, thread_creator, forum_id) values ('Has anyone heard of Edis?', 'charlie', 1);

insert into posts (post_text, post_authorid, post_forumid, post_threadId) values ('I am having trouble connecting to Redis. Do you have any idea how to do it?','bob', 1, 1);
insert into posts (post_text, post_authorid, post_forumid, post_threadId) values ('I Think you can google it', 'alice', 1, 1);
insert into posts (post_text, post_authorid, post_forumid, post_threadId) values ('I want to use Edis for a project. Is it a good idea to use it for back end development?','holly', 1, 2);

insert into forums (forum_name, forum_creator) values ('redis', 'alice');
insert into forums (forum_name, forum_creator) values ('mongodb', 'bob');
insert into forums (forum_name, forum_creator) values ('python', 'bob');
insert into forums (forum_name, forum_creator) values ('flask', 'bob');

insert into users (username, password) values ('holly', 'password');
insert into users (username, password) values ('nguyen', 'password');
insert into users (username, password) values ('bob', 'password');
insert into users (username, password) values ('alice', 'password');