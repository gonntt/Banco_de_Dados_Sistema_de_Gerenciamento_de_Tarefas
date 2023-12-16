-- Preenchendo a tabela "project.users"
INSERT INTO project.users (name, email, password)
VALUES 
  ('Gabriel Bento Gonçalves dos Santos', 'gabriel@example.com', 'senha123'),
  ('Gabriel Gonçalves do Nascimento', 'gabriel.n@example.com', 'outrasenha'),
  ('Daniel Santos', 'daniel@example.com', 'minhasenha');

-- Preenchendo a tabela "project.teams"
INSERT INTO project.teams (name, description)
VALUES 
  ('Time A', 'Descrição do Time A'),
  ('Time B', 'Descrição do Time B');

-- Preenchendo a tabela "project.user_teams"
INSERT INTO project.user_teams (user_id, team_id)
VALUES 
  (1, 1), -- Gabriel Bento Gonçalves dos Santos no Time A
  (2, 1), -- Gabriel Gonçalves do Nascimento no Time A
  (3, 2); -- Daniel Santos no Time B

-- Preenchendo a tabela "project.status"
INSERT INTO project.status (name)
VALUES 
  ('Pendente'),
  ('Concluído'),
  ('Em andamento');

-- Preenchendo a tabela "categories"
INSERT INTO project.categories (name)
VALUES 
  ('Categoria 1'),
  ('Categoria 2'),
  ('Categoria 3');

-- Preenchendo a tabela "tasks"
INSERT INTO project.tasks (parent_task_id, user_id, team_id, status_id, type_id, name, body, date)
VALUES 
  (NULL, 1, NULL, 1, 1, 'Tarefa 1', 'Corpo da Tarefa 1', '2023-09-30'),
  (NULL, 2, 1, 2, 2, 'Tarefa 2', 'Corpo da Tarefa 2', '2023-10-05');

-- Preenchendo a tabela "subtasks"
INSERT INTO project.subtasks (parent_task_id, user_id, team_id, status_id, type_id, name, body, date)
VALUES 
  (1, 1, NULL, 1, 1, 'Subtarefa 1 da Tarefa 1', 'Corpo da Subtarefa 1', '2023-10-01'),
  (1, 2, NULL, 1, 2, 'Subtarefa 2 da Tarefa 1', 'Corpo da Subtarefa 2', '2023-10-02');

-- Preenchendo a tabela "notifications"
INSERT INTO project.notifications (user_id, task_id, message, timestamp)
VALUES 
  (1, 1, 'Notificação para Tarefa 1', '2023-09-30 12:00:00'),
  (2, 2, 'Notificação para Tarefa 2', '2023-10-05 14:30:00');

-- Preenchendo a tabela "comments"
INSERT INTO project.comments (user_id, task_id, body)
VALUES 
  (1, 1, 'Comentário na Tarefa 1'),
  (2, 2, 'Comentário na Tarefa 2');

-- Preenchendo a tabela "comments_attachments"
INSERT INTO project.comments_attachments (comment_id, filename, filepath, url)
VALUES 
  (1, 'anexo1.txt', '/path/to/file/anexo1.txt', 'https://example.com/anexo1'),
  (2, 'anexo2.txt', '/path/to/file/anexo2.txt', 'https://example.com/anexo2');