CREATE DATABASE salon;CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL
);CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    time VARCHAR(20) NOT NULL,
    customer_id INT NOT NULL REFERENCES customers(customer_id),
    service_id INT NOT NULL REFERENCES services(service_id)
);
INSERT INTO
    services (service_id, name)
VALUES
    (1, 'cut'),
    (2, 'color'),
    (3, 'perm'),
    (4, 'style'),
    (5, 'trim');