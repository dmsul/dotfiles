#! /bin/bash

# NOTE: must be run as user `nominatim` (which has postgresql permissions)

./utils/setup.php --osm-file /srv/nominatim/Nominatim/build/data/us-latest.osm.pbf --all --osm2pgsql-cache 2000 2>&1 | tee setup.log

# Optional
./utils/update.php --recompute-word-counts
