## 01-
    select nome,
    idade 
    from aluno 
    order by idade;

## 02-
    select idaluno,
    nome 
    from aluno
    order by nome DESC;

## 03- 
    select * 
    from aluno 
    order by idade DESC ,nome asc;

## 04- 
    select * 
    from aluno 
    order by sexo, nome;

## 05-
    update aluno set idade = 20  where nome ='jose';

## 06-
 update aluno set idade = 21 where nome in ('tadeu','cesar',marisa'); 

## 07-
 update aluno set nome ='Luiz', idade = 22, sexo ='m', cidade = 'Tijucas' where idaluno = 12;

## 08- 
update aluno set cidade = null where idade > 24;

## 09-
 delete from aluno where cidade is null;

## 10-
 delete from aluno where cidade = 'tubarao'and idade > 15 and sexo = 'm';
 
## 11-
 delete from aluno where nome in ('Tadeu','Alice','Maria') and idade = 19;

## 12-
 delete from aluno where (idade < 18 and sexo = 'm') or (idade < 21 and sexo = 'f')