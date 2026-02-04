# Forest Change Analysis – UK National Parks

This repository documents a workflow combining Google Earth Engine (GEE) and R
to quantify forest gain and loss in selected UK National Parks:
Yorkshire Dales, North York Moors, Lake District, and Northumberland.

## Workflow Overview

### 1. Google Earth Engine
- Filter WDPA data to National Parks (`DESIG_ENG = "National Park"`)
- Reduce raster forest change layers to park polygons
- Export results as CSV to Google Drive, selecting only required columns
  (`NAME`, `GIS_AREA`, `sum`) to avoid large geometry fields
- Example map outputs included in `GEE/screenshots/`

### 2. R Visualisation
- Combine forest loss and gain tables exported from GEE
- Handle large CSV geometry fields prior to visualisation
- Produce plots of forest change per park
- R script located in `R/`, plot in `R/screenshots/`

## Notes
- The GitHub repository mirrors the canonical GEE scripts and includes R code for reproducibility and demonstration purposes.
- Data sources: WDPA polygons and forest change rasters (as in Our Coding Club Earth Engine tutorial)  
  Tutorial link: [Our Coding Club – Earth Engine](https://ourcodingclub.github.io/tutorials/earth-engine/)
- Visualisations highlight temporal and spatial patterns of forest change across UK National Parks.
