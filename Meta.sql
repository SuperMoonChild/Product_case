Table 1: user_age

userid, age, country
-------------------------------------------------
1, 27, 'India'
2, 35, 'China'
5, 23, 'US'
44, 47, 'Italy'

userid, name
-------------------------------------------------
1,'peter'
2,'brian'
5,'mark'
3,'david'
55,'sheryl'

3) Find all distinct userid pairs with the same name, output userid_1, userid_2, name

with base as (
select 
	f.user_id as u1, 
	s.user_id as u2,
	f.name
from 
	username f
inner join 
	username s on f.name = s.name
	and s.user_id <> f.user_id ) 
	
1,'peter' peter 17
17,'peter' peter 1
V
1, 17, peter, 
17, 1, peter

select 
	least(u1,u2) as u1, 
	GREATEST(u1,u2) as u2, 
	name 
from 
	base
