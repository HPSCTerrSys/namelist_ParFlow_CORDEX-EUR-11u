# Import the ParFlow TCL package
lappend auto_path $env(PARFLOW_DIR)/bin
package require parflow
namespace import Parflow::*

pfset FileVersion 4

pfset Process.Topology.P __nprocx_pfl_bldsva__
pfset Process.Topology.Q __nprocy_pfl_bldsva__
pfset Process.Topology.R 1
# THE COMPUTATIONAL GRID IS A (BOX) THT CONTAINS THE MAIN PROBLEM. THIS CAN EITHER BE EXACTLY THE SIZE
# OF THE PROBLEM OR LARGER. A BOX GEOMETRY IN PARFLOW CAN BE ASIGNED BY EITHER SPECIFYING COORDINATES FOR
# TWO CORNERS OF THE BOX OR GRID SIZE AND NUMBER OF CELLS IN X,Y, AND Z.
#------------------------------------------------------------------------
# Computational Grid: It Defines The Grid Resolutions within The Domain
#------------------------------------------------------------------------
pfset ComputationalGrid.Lower.X                  0.0
pfset ComputationalGrid.Lower.Y                  0.0
pfset ComputationalGrid.Lower.Z                  0.0

pfset ComputationalGrid.DX                       12500.0
pfset ComputationalGrid.DY                       12500.0
pfset ComputationalGrid.DZ                       1.0

pfset ComputationalGrid.NX                       444
pfset ComputationalGrid.NY                       432
pfset ComputationalGrid.NZ                       30

#-----------------------------------------------------------------------------
# Domain
#-----------------------------------------------------------------------------
pfset Domain.GeomName                            domain

#--------------------------------------------------------
# Distribute Files 
#--------------------------------------------------------
set data [pfload -sa EUR-11_TSMP_FZJ-IBG3_eCLMPFLDomain_444x432_INDICATOR_regridded_rescaled_SoilGrids250-v2017_BGR3_alv.sa]
pfsave $data -pfb EUR-11_TSMP_FZJ-IBG3_eCLMPFLDomain_444x432_INDICATOR_regridded_rescaled_SoilGrids250-v2017_BGR3_alv.pfb
pfdist EUR-11_TSMP_FZJ-IBG3_eCLMPFLDomain_444x432_INDICATOR_regridded_rescaled_SoilGrids250-v2017_BGR3_alv.pfb
