-- step 5: Mart - Create priority roles mart

DROP SCHEMA IF EXISTS priority_mart CASCADE

CREATE SCHEMA priority_mart;

SELECT '=== Loading Roles for Priority Mart ===' AS info;
CREATE TABLE priority_mart.priority_roles (
    role_id         INTEGER     PRIMARY KEY,
    role_name       VARCHAR,
    priority_lvl    INTEGER
)

INSERT INTO priority_mart.priority_roles (role_id, role_name, priority_lvl)
VALUES
    (1, 'Data Engineer',        2),
    (2, 'Senior Data Engineer', 1),
    (3, 'Software Engineer',    3);

SELECT * FROM priority_mart.priority_roles;



