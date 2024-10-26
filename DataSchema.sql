-- Опис педагогів
CREATE TABLE Teachers (
    teacher_id NUMBER(4), 
    full_name VARCHAR(50) NOT NULL,
    position VARCHAR(30) NOT NULL
);

-- Обмеження первинного ключа
ALTER TABLE Teachers ADD CONSTRAINT teachers_pk
    PRIMARY KEY (teacher_id);

-- Опис навчальних матеріалів
CREATE TABLE Materials (
    material_id NUMBER(4), 
    title VARCHAR(100) NOT NULL,
    contents TEXT NOT NULL, 
    date_created TIMESTAMP NOT NULL, 
    teacher_id NUMBER(4) NOT NULL 
);

-- Обмеження первинного ключа
ALTER TABLE Materials ADD CONSTRAINT materials_pk
    PRIMARY KEY (material_id);

-- Обмеження зовнішнього ключа
ALTER TABLE Materials ADD CONSTRAINT materials_teacher_fk
    FOREIGN KEY (teacher_id) 
    REFERENCES Teachers (teacher_id);

-- Опис рекомендацій
CREATE TABLE Recommendations (
    recommendation_id NUMBER(4), 
    recommendation_description TEXT NOT NULL, 
    recommendation_date TIMESTAMP NOT NULL, 
    material_id NUMBER(4) NOT NULL,
    analysis_id NUMBER(4) NOT NULL 
);

-- Обмеження первинного ключа
ALTER TABLE Recommendations ADD CONSTRAINT recommendations_pk
    PRIMARY KEY (recommendation_id);

-- Обмеження зовнішнього ключа
ALTER TABLE Recommendations ADD CONSTRAINT recommendations_material_fk
    FOREIGN KEY (material_id) 
    REFERENCES Materials (material_id);

ALTER TABLE Recommendations ADD CONSTRAINT recommendations_analysis_fk
    FOREIGN KEY (analysis_id) 
    REFERENCES Analyses (analysis_id);

-- Опис аналізу
CREATE TABLE Analyses (
    analysis_id NUMBER(4), 
    result VARCHAR(100) NOT NULL, 
    date_analysis TIMESTAMP NOT NULL, 
    material_id NUMBER(4) NOT NULL 
);

-- Обмеження первинного ключа
ALTER TABLE Analyses ADD CONSTRAINT analyses_pk
    PRIMARY KEY (analysis_id);

-- Обмеження зовнішнього ключа
ALTER TABLE Analyses ADD CONSTRAINT analyses_material_fk
    FOREIGN KEY (material_id) 
    REFERENCES Materials (material_id);

-- Опис вологості
CREATE TABLE Humidities (
    humidity_id NUMBER(4), 
    value NUMBER(5,2) NOT NULL, 
    date_measurement TIMESTAMP NOT NULL, 
    teacher_id NUMBER(4) NOT NULL 
);

-- Обмеження первинного ключа
ALTER TABLE Humidities ADD CONSTRAINT humidities_pk
    PRIMARY KEY (humidity_id);

-- Обмеження зовнішнього ключа
ALTER TABLE Humidities ADD CONSTRAINT humidities_teacher_fk
    FOREIGN KEY (teacher_id) 
    REFERENCES Teachers (teacher_id);
