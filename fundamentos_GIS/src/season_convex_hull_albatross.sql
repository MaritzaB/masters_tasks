select 
	temporada,
	st_astext(st_convexhull(st_collect(geom))) as geom,
	st_area(st_astext(st_convexhull(st_collect(st_transform(geom,3857))))) as area
from (
	select *,
	case 
		when date similar to '201[4-8]-(12|01)-([0-2][1-9]|3[01])|201[4-8]-(02)-(0[1-6])' then 'incubacion'
		when date similar to '201[4-8]-(02)-(0[7-9]|1[0-9]|20)' then 'empollamiento'
		when date similar to '201[4-8]-(02)-(2[1-9])|201[4-8]-(0[3-7])-([0-3][0-9])' then 'crianza'
		else 'no reproduccion'
	end temporada
	from "gps-albatros-isla-guadalupe") as se
group by temporada
