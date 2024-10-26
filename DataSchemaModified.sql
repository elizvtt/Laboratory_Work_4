-- Опис педагогів
CREATE TABLE teachers (
    teacher_id NUMBER(4) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL CHECK (
        REGEXP_LIKE(full_name, '^[A-ZА-Я][a-zа-я]+\s[A-ZА-Я][a-zа-я]+$')
    ),
    position VARCHAR(30) NOT NULL CHECK (
        position IN ('Teacher', 'Assistant', 'Professor')
    )
);

-- Опис навчальних матеріалів
CREATE TABLE materials (
    material_id NUMBER(4) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    contents VARCHAR(1000) NOT NULL,
    date_created TIMESTAMP NOT NULL,
    teacher_id NUMBER(4) NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

-- Опис вологості
CREATE TABLE humidities (
    humidity_id NUMBER(4) PRIMARY KEY,
    value NUMBER(5, 2) NOT NULL,
    date_measurement TIMESTAMP NOT NULL,
    teacher_id NUMBER(4) NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers (teacher_id)
);

-- Опис аналізу
CREATE TABLE analyses (
    analysis_id NUMBER(4) PRIMARY KEY,
    result VARCHAR(100) NOT NULL,
    date_analysis TIMESTAMP NOT NULL,
    material_id NUMBER(4) NOT NULL,
    FOREIGN KEY (material_id) REFERENCES materials (material_id)
);

-- Опис рекомендацій
CREATE TABLE recommendations (
    recommendation_id NUMBER(4) PRIMARY KEY,
    recommendation_description TEXT NOT NULL,
    recommendation_date TIMESTAMP NOT NULL,
    material_id NUMBER(4) NOT NULL,
    analysis_id NUMBER(4) NOT NULL,
    FOREIGN KEY (material_id) REFERENCES materials (material_id),
    FOREIGN KEY (analysis_id) REFERENCES analyses (analysis_id)
);
