PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_likes
DROP TABLE IF EXISTS replies
DROP TABLE IF EXISTS questions_follows
DROP TABLE IF EXISTS questions
DROP TABLE IF EXISTS users

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);
INSERT INTO
  users (id, fname, lname)
VALUES
  (1, 'Spencer', 'Iascone');

INSERT INTO
  users (id, fname, lname)
VALUES
  (2, 'Diego', 'Chavez');

INSERT INTO
  users (id, fname, lname)
VALUES
  (3, 'Melissa', 'Flynn');

CREATE TABLE questions ( 
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,

    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);

INSERT INTO
  questions (id, title, body, associated_author_id)
VALUES
  (1, 'TA Question', 'How do I write a SQL Database?', 1);

INSERT INTO
  questions (id, title, body)
VALUES
  (2, 'Cooking Question', 'How to boil water?', 3);

INSERT INTO
  questions (id, title, body)
VALUES
  (3, 'Life Question', 'Socks?', 2);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  questions_follows (id, user_id, question_id)
VALUES
  (1, 1, 1);

INSERT INTO
  questions_follows (id, user_id, question_id)
VALUES
  (2, 3, 3);

INSERT INTO
  questions_follows (id, user_id, question_id)
VALUES
  (3, 2, 2);
  
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    reply_user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER NOT NULL,

    FOREIGN KEY (reply_user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)

);

INSERT INTO
  replies (id, body, reply_user_id, question_id, parent_reply_id)
VALUES
  (1, 'You should hit the Question Button, Guy', 1 , 1, 1);
INSERT INTO
  replies (id, body, reply_user_id, question_id, parent_reply_id)
VALUES
  (2, 'Raise water temperature over 212 degrees', 2 , 2, 2);
INSERT INTO
  replies (id, body, reply_user_id, question_id, parent_reply_id)
VALUES
  (3, 'Socks are sweaters for feet', 3 , 3, 3);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  question_likes (id, user_id, question_id)
VALUES
  (1,1,1);
INSERT INTO
  question_likes (id, user_id, question_id)
VALUES
  (1,1,1);
INSERT INTO
  question_likes (id, user_id, question_id)
VALUES
  (1,1,1);