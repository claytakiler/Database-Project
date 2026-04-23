CREATE TABLE lawyer (
    lawyer_ID INT,
    name VARCHAR(20),
    title VARCHAR(10),
    salary DECIMAL(10,2),
    PRIMARY KEY (lawyer_ID),
    CHECK (title IN ('partner', 'associate'))
);