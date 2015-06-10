#!/bin/bash
DATE=$(date +'%d%m%Y-%H%M')
PROJECT="$1"
DIRECTORY="$2"
MAPFILE=${PROJECT}_${DATE}_mapfile

esginitialize -i /esg/config/esgcet/esg.ini -c
esgscan_directory --read-files --project $PROJECT -o $MAPFILE $DIRECTORY
esgpublish --map $MAPFILE --project $PROJECT
esgpublish --map $MAPFILE --project $PROJECT --noscan --thredds
esgpublish --map $MAPFILE --project $PROJECT --noscan --publish
