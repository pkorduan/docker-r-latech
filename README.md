# docker-r-latech
Debian with installed r and latech packages to create PDF-Reports
# Changelog
# 1.3.1
  * Switch to version 2.0-7 for gstat package due to compile error in default version 2.0-8
# 1.3.0
  * imagemagick installed
  * Add R packages gridExtra, png
# 1.2.0
  * call CMD with full path
  * support all Languages from Debian
  * Add R packages RPostgreSQL und RPostgres
# 1.1.0
  * Without apache and include and start the report-generator script
  * Add volumes for scripts, logs, cache, pdfs and www
  * remove port 80
# 1.0.0
  * Initial with apache2
