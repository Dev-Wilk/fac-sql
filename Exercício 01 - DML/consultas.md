## 1-
    SELECT * FROM ALUNO WHERE sexo ='M';

## 2-
    SELECT nome FROM ALUNO WHERE idade = 19;

## 3- 
    SELECT * FROM ALUNO WHERE nome LIKE 'D%'

## 4-
    SELECT * FROM ALUNO WHERE idade BETWEEN 20 AND 22;

## 5-
    SELECT * FROM ALUNO WHERE cidade IS NULL;

## 6-
    SELECT * FROM ALUNO WHERE cidade = 'Blumenau';

## 7-
    SELECT nome FROM ALUNO WHERE idade != 18;

## 8-
    SELECT * FROM ALUNO WHERE nome LIKE '%RI%';

## 9- 
    SELECT * FROM ALUNO WHERE cidade = 'São José' AND sexo = 'M' AND idade <20;

## 10-
    SELECT * FROM ALUNO WHERE (sexo = 'F' AND idade > 20) OR (sexo = 'M' AND idade > 17);

## 11-
    SELECT * FROM ALUNO WHERE nome LIKE '%A%' AND LIKE '%R%';

## 12-
    SELECT nome, idade FROM ALUNO WHERE sexo ='F';

## 13-
    SELECT idaluno, nome FROM ALUNO WHERE cidade = 'Blumenau';

## 14-
    SELECT nome, cidade FROM ALUNO WHERE idade <19;

## 15-
    SELECT nome, cidade FROM ALUNO

## 16-
    SELECT cidade FROM ALUNO WHERE cidade IS NOT NULL;

## 17-
    SELECT nome FROM ALUNO WHERE (idade = 18 AND cidade = 'Palhoça') OR (idade = 17 AND cidade = 'São José');

## 18- 
    SELECT nome FROM ALUNO WHERE sexo = 'M' AND cidade = 'Tubarão" AND idade > 18 AND idade < 25;