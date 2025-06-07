use emp;
CREATE TABLE EMPLOYEES (
    empid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    desig VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (emp_id, name, email, desig) VALUES ('000001' , 'John Doe', 'john.doe@example.com' , 'developer');

