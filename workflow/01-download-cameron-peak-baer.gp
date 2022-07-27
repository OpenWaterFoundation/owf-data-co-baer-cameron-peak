# Download and convert the Burn Area Emergency Response Soil Burn Severity data from the USFS archive:
# - Cameron Peak wildfire 2020
# - see:  https://fsapps.nwcg.gov/baer/baer-imagery-support-data-download
#
# Raster
CreateFolder(Folder="downloads/USFS-CameronPeak-BAER",CreateParentFolders="True",IfFolderExists="Ignore")
# Old.
#WebGet(URL="https://fsapps.nwcg.gov/baer/sites/baer/files/cameronpeak_sbs_0.zip",OutputFile="downloads/USFS-CameronPeak-BAER/cameronpeak_sbs_0.zip",Timeout="10")
WebGet(URL="https://edcintl.cr.usgs.gov/downloads/sciweb1/shared/MTBS_Fire/data/baer/cameronpeak_sbs.zip",OutputFile="downloads/USFS-CameronPeak-BAER/cameronpeak_sbs.zip",Timeout="10")
UnzipFile(File="downloads/USFS-CameronPeak-BAER/cameronpeak_sbs.zip",OutputFolder="downloads/USFS-CameronPeak-BAER",IfFolderDoesNotExist="Create")
#
# Read the file from 'downloads/' and rewrite to 'data/' as GeoJSON
# - TODO smalers 2021-05-18 decide whether GeoJSON format will be used
# - tends to be very large so perhaps a heatmap rather than cells is needed
#ReadGeoLayerFromShapefile(InputFile="downloads/CameronPeak_SBS_shapefile/CameronPeak_SBS20201111.shp",GeoLayerID="CameronPeakSBSLayer",Name="Cameron Peak Burn Severity",Description="Cameron Peak Burn Severity")
#WriteGeoLayerToGeoJSON(GeoLayerID="CameronPeakSBSLayer",OutputFile="layers/cameron-peak-sbs.geojson")
#
# Read the raster layer.
# ReadRasterGeoLayerFromFile(InputFile="downloads/CameronPeak_SBS_raster2/CPSBS20201111.tif",GeoLayerID="CameronPeakSBSRasterLayer",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")
ReadRasterGeoLayerFromFile(InputFile="downloads/USFS-CameronPeak-BAER/CameronPeak_SBS_final.tif",GeoLayerID="CameronPeakSBSRasterLayer",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")
ChangeRasterGeoLayerCRS(GeoLayerID="CameronPeakSBSRasterLayer",CRS="EPSG:4326")
# WriteRasterGeoLayerToFile(GeoLayerID="CameronPeakSBSRasterLayer",OutputFile="../data/cameron-peak-sbs.tif",OutputCRS="EPSG:4326")
WriteRasterGeoLayerToFile(GeoLayerID="CameronPeakSBSRasterLayer",OutputFile="../data/cameron-peak-2020-sbs.tif")
# Reread to confirm it is OK.
ReadRasterGeoLayerFromFile(InputFile="../data/cameron-peak-2020-sbs.tif",GeoLayerID="CameronPeakSBSRasterLayer2",Name="Cameron Peak Burn Severity (raster)",Description="Cameron Peak Burn Severity (raster)")