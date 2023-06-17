select st_astext(st_convexhull(st_collect(geom))) as geom
from "gps-albatros-isla-guadalupe";
