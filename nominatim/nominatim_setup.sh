#! /bin/bash

sudo apt-get update -qq

sudo apt-get install -y build-essential cmake g++ libboost-dev libboost-system-dev \
                        libboost-filesystem-dev libexpat1-dev zlib1g-dev libxml2-dev \
                        libbz2-dev libpq-dev libproj-dev \
                        postgresql-server-dev-10 postgresql-10-postgis-2.4 \
                        postgresql-contrib-10 postgresql-10-postgis-scripts \
                        apache2 php php-pgsql libapache2-mod-php php-pear php-db \
                        php-intl git

sudo useradd -d /srv/nominatim -s /bin/bash -m nominatim
sudo passwd nominatim

sudo chmod a+x /srv/nominatim

# Configure PostgreSQL

sudo cp ~/dotfiles/nominatim/postgresql.conf_pretune /etc/postgresql/10/main/postgresql.conf
sudo pg_ctlcluster 10 main restart

sudo systemctl restart postgresql

sudo -u postgres createuser -s nominatim
sudo -u postgres createuser www-data

# Setup Apache
sudo tee /etc/apache2/conf-available/nominatim.conf << EOFAPACHECONF
<Directory "/srv/nominatim/Nominatim/build/website">
  Options FollowSymLinks MultiViews
  AddType text/html   .php
  DirectoryIndex search.php
  Require all granted
</Directory>

Alias /nominatim /srv/nominatim/Nominatim/build/website
EOFAPACHECONF

sudo a2enconf nominatim
sudo systemctl restart apache2

# Build Nominatim
cd /srv/nominatim
sudo git clone --recursive git://github.com/openstreetmap/Nominatim
cd Nominatim

sudo wget -O data/country_osm_grid.sql.gz https://www.nominatim.org/data/country_grid.sql.gz

sudo mkdir build
cd build
sudo cmake /srv/nominatim/Nominatim
sudo make

sudo tee settings/local.php << EOF
<?php
 @define('CONST_Website_BaseURL', '/nominatim/');
EOF


