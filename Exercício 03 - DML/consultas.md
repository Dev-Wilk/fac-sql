## 01- 
    SELECT	sexo,
    count(*)
    FROM aluno
    group by sexo;

## 02-
     select idade,
     count(*)
     from aluno
     group by idade;

## 03-
    select cidade,
    count(*)
    from aluno 
    where cidade is not null group by cidade; 

## 04-
    select cidade,
    count(*)
    from aluno
    where cidade is null group by cidade;

## 05-
    select avg(idade)
    from aluno
    group by sexo; *

## 06-
    select count(*),
           avg(idade) 
    from aluno
    where cidade ='FLORIANOPOLIS'; *

## 07-
    select sexo,
           count(*) as quantidade_aluno 
    from aluno 
    where idade <> 18 group by sexo;

## 08- 
    select idade, 
    nome 
    from aluno 
    where (cidade = 'SAO JOSE' AND IDADE < 18) or (sexo = 'm' and idade<20);

09- select sexo,count(*) as quantidade_alunos from aluno where (sexo ='m' and idade >18 ) or (sexo = 'f' and idade > 21 ) group by sexo;
10- select max(idade), min(idade) from aluno where sexo ='f';
11- select sum(idade) from aluno where cidade ='BLUMENAU';
12- select sexo,count(*) as quantidade_alunos from aluno where idade between 14 and 19 and cidade <> 'palhoça' group by sexo;
13- select cidade, count(*) from aluno group by cidade having count(*) >3;
14- select idade, count(*) as quantidade_alunos  from aluno group by idade order by idade DESC;
15- select cidade,count(*) as quantidade_alunos, max(idade), min(idade), avg(idade) from aluno group by cidade having count(*)>3; 