-- SCHEMA: project

-- DROP SCHEMA IF EXISTS project ;

CREATE SCHEMA IF NOT EXISTS project
    AUTHORIZATION gabriel;
	
-- Criação da tabela "users"
CREATE TABLE IF NOT EXISTS project.users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    password VARCHAR(200) NOT NULL
);

-- Criação da tabela "teams"
CREATE TABLE IF NOT EXISTS project.teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT
);

-- Criação da tabela "user_teams"
CREATE TABLE IF NOT EXISTS project.user_teams (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES project.users(id),
    team_id INTEGER NOT NULL REFERENCES project.teams(id)
);

-- Criação da tabela "status"
CREATE TABLE IF NOT EXISTS project.status (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Criação da tabela "categories"
CREATE TABLE IF NOT EXISTS project.categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL
);

-- Criação da tabela "tasks"
CREATE TABLE IF NOT EXISTS project.tasks (
    id SERIAL PRIMARY KEY,
    parent_task_id INTEGER,
    user_id INTEGER NOT NULL REFERENCES project.users(id),
    team_id INTEGER REFERENCES project.teams(id),
    status_id INTEGER NOT NULL REFERENCES project.status(id),
    type_id INTEGER NOT NULL REFERENCES project.categories(id),
    name VARCHAR(200) NOT NULL,
    body TEXT,
    date TIMESTAMP
);

-- Criação da tabela "subtasks"
CREATE TABLE IF NOT EXISTS project.subtasks (
    id SERIAL PRIMARY KEY,
    parent_task_id INTEGER,
    user_id INTEGER NOT NULL REFERENCES project.users(id),
    team_id INTEGER REFERENCES project.teams(id),
    status_id INTEGER NOT NULL REFERENCES project.status(id),
    type_id INTEGER NOT NULL REFERENCES project.categories(id),
    name VARCHAR(200) NOT NULL,
    body TEXT,
    date TIMESTAMP
);

-- Criação da tabela "notifications"
CREATE TABLE IF NOT EXISTS project.notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES project.users(id),
    task_id INTEGER NOT NULL REFERENCES project.tasks(id),
    message TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL
);

-- Criação da tabela "comments"
CREATE TABLE IF NOT EXISTS project.comments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES project.users(id),
    task_id INTEGER NOT NULL REFERENCES project.tasks(id),
    body TEXT NOT NULL
);

-- Criação da tabela "comments_attachments"
CREATE TABLE IF NOT EXISTS project.comments_attachments (
    id SERIAL PRIMARY KEY,
    comment_id INTEGER NOT NULL REFERENCES project.comments(id),
    filename VARCHAR(200),
    filepath VARCHAR(200),
    url VARCHAR(200)
);
