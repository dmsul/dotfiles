#! /bin/bash

sudo apt-get install osmium-tool

# https://download.geofabrik.de/north-america/us-midwest-latest.osm.pbf
# https://download.geofabrik.de/north-america/us-northeast-latest.osm.pbf
# https://download.geofabrik.de/north-america/us-pacific-latest.osm.pbf
# https://download.geofabrik.de/north-america/us-south-latest.osm.pbf
# https://download.geofabrik.de/north-america/us-west-latest.osm.pbf

sudo osmium merge ~/Downloads/*.pbf -o /srv/nominatim/Nominatim/build/data/us-latest.osm.pbf
