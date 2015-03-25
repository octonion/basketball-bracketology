begin;

insert into picks.rounds
(year,round_id,school_id,school_name,bracket,p,k_id,eid)
(
select
r1.year as year,
r1.round_id+1 as round,
r1.school_id,
r1.school_name,
r1.bracket,
coalesce(
sum(
r1.p*r2.p*
coalesce(
sf1.strength/
(sf1.strength+sf2.strength),1.0)),1.0) as p,
r1.k_id,
r1.eid

from picks.rounds r1
left join picks.rounds r2
  on ((r1.year,r1.round_id,r1.bracket[r1.round_id+1])=
      (r2.year,r2.round_id,r2.bracket[r1.round_id+1])
       and not(r1.bracket[r1.round_id]=r2.bracket[r1.round_id]))
join picks.ranks sf1
  on (sf1.id)=(r1.k_id)
left join picks.ranks sf2
  on (sf2.id)=(r2.k_id)
where
    r1.year=2015
and r1.round_id=1
group by r1.year,round,r1.school_id,r1.school_name,r1.bracket,r1.k_id,r1.eid
);

commit;
