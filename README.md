OpenIR_ImageProcAndPrep
=======================

Scripts to process landsat bands, create composites, and make these bands viewable on the web.

========================
requirements gdal2tiles_openir.py
========================

* a tif composite must be renamed to the numbers that compose it. i.e: "p200163r366-321.geo.tifGEO.tif" must be renamed to "321.tif" (NOW this is taken care of by the bash script)

=======================
NOTES gdal2tiles_openir.py
=======================
 *Bands' labels are specified under the function  def combs2html(combs): in a dictionary called "labels"


*To run the script use this 
python gdal2tiles_openir.py  -options [file1,file2,file3,…,filen] OUTPUT_DIR

* you must specify the output path for this code to run properly
python gdal2tiles_openir.py  [jakarta/321.tif,jakarta/432.tif,jakarta/453.tif,jakarta/543.tif,jakarta/754.tif,jakarta/751.tif,jakarta/753.tif,jakarta/642.tif,jakarta/451.tif] Documents/maps

!!NOTE: Do not insert any spaces between the filenames in the list. The entire list must have ZERO spaces for the bash to handle it properly

