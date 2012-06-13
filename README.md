OpenIR_ImageProcAndPrep
=======================

Scripts to process landsat bands, create composites, and make these bands viewable on the web.

========================
requirements gdal2tiles_openir.py
========================
* bash script must write an array of combinations in a file called "combs.txt"
* a tif composite must be renamed to the numbers that compose it. i.e: "p200163r366-321.geo.tifGEO.tif" must be renamed to "321.tif"
=======================
NOTES gdal2tiles_openir.py
=======================
 *Bands' labels are specified under the function  def combs2html(combs): in a dictionary called "labels"

*The py script will read the available band combinations from a file in it's directory called "combs.txt" the file will have only one lines that is a list of the combinations. ex: [423,754,751]

*To run the script use this 
python gdal2tiles_openir.py  -options [file1,file2,file3,…,filen]

python gdal2tiles_openir.py  [jakarta/321.tif,jakarta/432.tif,jakarta/453.tif,jakarta/543.tif,jakarta/754.tif,jakarta/751.tif,jakarta/753.tif,jakarta/642.tif,jakarta/451.tif]

!!NOTE: Do not insert any spaces between the filenames in the list. The entire list must have ZERO spaces

