select pnome, unome from funcionario
where salario > 30000;

select pnome, endereco from funcionario
inner join departamento on dnome = 'Administracao';

select unome, horas from funcionario
inner join trabalhaem on projnumero = 3
order by horas DESC;

select pnome, unome from funcionario
inner join projeto on projnome = 'Transmogrifador';

select F.pnome, F.unome, D.pnome, D.unome from funcionario as F
left outer join funcionario as D on F.cpfsuperv = D.cpf;

select count(*)
from projeto;

select P.projnome, min(T.horas), max(T.horas), avg(T.horas)
from projeto as P
inner join trabalhaem as T on P.projnumero = T.projnumero
group by P.projnome;
