--Exibe todos os usuários
SELECT * FROM project.users;

-- Exibe todos os times
SELECT * FROM project.teams;

-- Seleciona uma tarefa e suas subtarefas
SELECT 
  t.name AS task_name, 
  s.name AS subtask_name 
FROM project.tasks t
LEFT JOIN project.subtasks s ON t.id = s.parent_task_id;

-- Exibe todas as tarefas com status e categoria
SELECT 
  t.name AS task_name, 
  s.name AS status_name, 
  c.name AS category_name
FROM project.tasks t
JOIN project.status s ON t.status_id = s.id
JOIN project.categories c ON t.type_id = c.id;

-- Notificações

SELECT 
  n.message, 
  n.timestamp 
FROM project.notifications n
WHERE n.user_id = 1; -- Alterar ID do usuário

-- Consulta para obter todas as tarefas do usuário
SELECT 
  t.id AS task_id,
  t.name AS task_name,
  t.body AS task_body,
  t.date AS task_date,
  s.name AS status_name,
  c.name AS category_name
FROM project.tasks t
JOIN project.status s ON t.status_id = s.id
JOIN project.categories c ON t.type_id = c.id
WHERE t.user_id = 1;

-- Seleciona uma tarefa e seus respectivos comentários, assim como que fez ele
SELECT 
  t.name AS task_name,
  c.body AS comment_body,
  u.name AS commenter_creator
FROM project.comments c
JOIN project.users u ON c.user_id = u.id
JOIN project.tasks t ON c.task_id = t.id
WHERE c.task_id = 1;