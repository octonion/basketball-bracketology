begin;

drop table if exists picks.rounds;

create table picks.rounds (
	year				integer,
	round_id			integer,
	school_id			text,
	school_name			text,
	bracket				int[],
	p				float,
	primary key (year,round_id,school_id)
);

copy picks.rounds from '/tmp/rounds.csv' with delimiter as ',' csv header quote as '"';

alter table picks.rounds add column k_id integer;

update picks.rounds
set k_id=k.team_id
from kaggle.teams k
where school_id=k.sr_id;

alter table picks.rounds add column eid integer;

update picks.rounds
set eid=t.eid
from picks.teams t
where rounds.k_id=t.k_id;

commit;
