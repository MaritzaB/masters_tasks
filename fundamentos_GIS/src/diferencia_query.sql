select st_astext(
	st_difference(
		(select st_astext(st_convexhull(st_collect(geom))) 
		from "gps-albatros-isla-guadalupe"),
		(select st_astext(st_collect(geom)) from "americas"
		where country = 'United States' or country = 'Mexico')
		)
	) as geom
