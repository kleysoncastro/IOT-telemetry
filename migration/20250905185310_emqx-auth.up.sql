DROP TYPE IF EXISTS ACTION;
DROP TYPE IF EXISTS PERMISSION;

CREATE TYPE ACTION AS ENUM('publish','subscribe','all');
CREATE TYPE PERMISSION AS ENUM('allow','deny');

CREATE TABLE IF NOT EXISTS mqtt_acl (
  id SERIAL PRIMARY KEY,
  ipaddress CHARACTER VARYING(60) NOT NULL DEFAULT '',
  username CHARACTER VARYING(255) NOT NULL DEFAULT '',
  password_hash CHARACTER VARYING(255) NOT NULL DEFAULT '',
  clientid CHARACTER VARYING(255) NOT NULL DEFAULT '',
  action ACTION,
  permission PERMISSION,
  topic JSONB NOT NULL,
  qos SMALLINT,
  retain SMALLINT
);

-- Índice normal no campo username
CREATE INDEX IF NOT EXISTS mqtt_acl_username_idx ON mqtt_acl(username);

INSERT INTO mqtt_acl(username,password_hash, permission, action, topic, ipaddress, qos, retain) VALUES ('cliente1','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'allow', 'all', '["/allca/bridge", "/allca/confirm"]', '192.168.1.7', 1, 0);
-- INSERT 0 1




--SELECT permission, action, topic, ipaddress, qos, retain FROM mqtt_acl WHERE username = ${username};


-- SELECT action, permission, topic FROM mqtt_acl where username = ${username}


-- SELECT action, permission, jsonb_array_elements_text(topic) AS topic FROM mqtt_acl WHERE username = ${username}


-- SELECT password_hash FROM mqtt_acl where username = ${username} LIMIT 1