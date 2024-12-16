select a.place_name, sl.timestamp from areas a, sleigh_locations sl where st_dwithin(a.polygon, sl.coordinate,100) order by timestamp desc;

