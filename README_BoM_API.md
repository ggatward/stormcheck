
BOM have standardised on an XML format for data, using a schema they call AMOC.
Details of this schema can be downloaded from:

The BOM API (for want of a better term) is actually an FTP site at  ftp://ftp.bom.gov.au/anon/

The AMOC formatted XML files are downloaded from within the "Forecasts Warnings & Observations" path:
    ftp://ftp.bom.gov.au/anon/gen/fwo/

Elements are mapped to an AREA code that is used within the BOM GeoSpatial data for graphical representation.
The stormcheck script makes use of the "Public Warning (PW)" and "Metropolitan (ME)" area codes, as these are used within the warning XML.  The definition of these warning areas is embedded within the GIS shapefiles create and used by BOM, and these can be downloaded from  ftp://ftp.bom.gov.au/anon/home/adfd/spatial/

IDM00001 - Public Weather Forecast District boundaries  (wget ftp://ftp.bom.gov.au/anon/home/adfd/spatial/IDM00001.zip)
IDM00014 - Metropolitan and Other Forecast Areas        (wget ftp://ftp.bom.gov.au/anon/home/adfd/spatial/IDM00014.zip)

Within the zip files are the elements of the shapefiles - these can be imported into a GIS mapping tool such as MapWindow
One of the elements of the Shapefile is the "database", which has a .dbf extension.  The strings command can be used to kind of view some of the data from the Linux command line - if we grep for a know area we can see enough plain text to map out all of the areas.

For example
```
$ strings IDM00001.dbf | grep NSW_PW
```

These areas are then added to the "stormcheck_locations.vkN" configuration files - UNCOMMENTED lines are searched for in the warning XML to trigger the announcements.
