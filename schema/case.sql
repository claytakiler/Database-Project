CREATE TABLE `case`(
    case_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    title VARCHAR(100),
    status ENUM('open', 'in trial', 'on appeal', 'settled', 'closed') DEFAULT 'open',
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);