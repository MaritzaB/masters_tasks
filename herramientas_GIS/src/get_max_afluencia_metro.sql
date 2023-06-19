-- Obtiene la estación del metro con máxima afluencia en una fecha dada y un
-- buffer al rededor de 800 metros de radio.

select m.fecha, m.max_afluencia, t.estacion, getLn(t.linea) as linea,
	em.id, geom as st_geom,
	st_transform(st_buffer(st_transform(em.geom,32614),800),4326)  as geom
	from (select sq.fecha, max(sq.total_afluencia) as max_afluencia
	from(
		select fecha, linea, estacion, sum(afluencia) as total_afluencia
 		from clase_afluencia_stc cas 
 		group by fecha, linea, estacion) sq
	where sq.fecha = '2023-03-22'
	group by sq.fecha) m
join (
	select fecha, linea, estacion, sum(afluencia) as total_afluencia
	from clase_afluencia_stc cas 
	group by fecha, linea, estacion) t
on
	t.fecha = m.fecha and t.total_afluencia = m.max_afluencia
join
	"STC_Metro_estaciones_utm14n" em
on
	getLn(t.linea) = em.linea and t.estacion = em.nombre
;
