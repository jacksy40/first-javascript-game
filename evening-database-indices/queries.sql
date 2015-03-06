explain analyze select name from ingredients where name='Brussels sprouts';
explain analyze select count (name) from ingredients where name = 'Brussels sprouts';
explain analyze select name from ingredients where unit='gallon(s)';
explain analyze select * from ingredients where unit='gallon(s)' and name='Brussels sprouts' or name like'j%';
