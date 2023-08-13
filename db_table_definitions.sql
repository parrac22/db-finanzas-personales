
CREATE DATABASE db_app_finanzas_personales;


USE db_app_finanzas_personales;


-- Crear la tabla User
CREATE TABLE User (
    user_id VARCHAR(255) PRIMARY KEY NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

-- Crear la tabla Transaction
CREATE TABLE Transaction (
    transaction_id VARCHAR(255) PRIMARY KEY NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    transaction_category_id VARCHAR(255) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    transaction_amount FLOAT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (transaction_category_id) REFERENCES TransactionCategory(transaction_category_id)
);

-- Crear la tabla Currency
CREATE TABLE Currency (
    currency_id VARCHAR(255) PRIMARY KEY NOT NULL,
    transaction_id VARCHAR(255) NOT NULL,
    currency_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id)
);

-- Crear la tabla TransactionCategory
CREATE TABLE TransactionCategory (
    transaction_category_id VARCHAR(255) PRIMARY KEY NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    budget_id VARCHAR(255),
    category_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (budget_id) REFERENCES Budget(budget_id)
);

-- Crear la tabla Budget
CREATE TABLE Budget (
    budget_id VARCHAR(255) PRIMARY KEY NOT NULL,
    transaction_category_id VARCHAR(255) NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    budget_monthly_limit_amount FLOAT NOT NULL,
    currency_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (transaction_category_id) REFERENCES TransactionCategory(transaction_category_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (currency_id) REFERENCES Currency(currency_id)
);

-- Crear la tabla SavingGoal
CREATE TABLE SavingGoal (
    saving_goal_id VARCHAR(255) PRIMARY KEY NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    saving_goal_amount FLOAT NOT NULL,
    saving_goal_expiration_date DATE NOT NULL,
    currency_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (currency_id) REFERENCES Currency(currency_id)
);
