;*************************************************
; vector_3.ncl
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"  
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"
;************************************************
begin
;************************************************
; read in data file
;************************************************

  file1 = "diag1.dat"

  n1 = 12950
  n2 = 14450





  data1 = asciiread(file1,(/n2,3/),"float")
  aH = 148.5
  visc = 0.0032
  Re1 = 150.0
  Re2 = 180.0
  ustar1 = (Re1*visc)/aH
  ustar2 = (Re2*visc)/aH 

  xx1 = new((/1,n2/),float)
  yy1 = new((/1,n2/),float)
  yy1(0,0:n1) = data1(0:n1,2) + 12.0
  xx1(0,0:n1) = data1(0:n1,0)*(ustar1/aH)
  yy1(0,n1:n2-1) = data1(n1:n2-1,2)+12.0
  xx1(0,n1:n2-1) = data1(n1:n2-1,0)*(ustar2/aH)






   ymax1 = 25
   ymin1 = 0
   xmin1 = 0.
   xmax1 = 140.   


;************************************************
; create plot
;************************************************

 wks   = gsn_open_wks ("pdf", "mean_flow")      ; open workstation
;wks   = gsn_open_wks ("x11", "flux" )        ; open workstation


; resources for "left" variable
resL                        = True 
resL@xyMarkLineModes     = (/"Lines","Lines","Lines","lines","Lines","Lines"/)
resL@xyMarkers           = (/18,16,6,12,10/)             ; choose type of marker
resL@xyMarkerSizes       = (/0.005,0.01,0.005,0.005,0.01,0.01,0.01/)               ; Marker size (default 0.01)
resL@xyMarkerColors       = (/"red","red","red","blue","black"/)
resL@xyLineColors       = (/"red","red","blue","blue","purple","black","black","black","red","red","red"/)
resL@xyMonoLineThickness = False
resL@xyDashPatterns = (/0,1,0,1,2,0,1,0,1,2,3/)
resL@xyLineThicknesses   = (/3.,1.,2.,2.,2.,1.,1.,1.,1./)
resL@vpXF                   = 0.15
resL@vpYF                   = 0.75
resL@vpHeightF              = 0.50
resL@vpWidthF              = 0.70
resL@tiXAxisString       = "" ; x-axis label
resL@tiYAxisString       = ""; y-axis label
resL@trYMaxF                = ymax1
resL@trYMinF                = ymin1
resL@trXMaxF                = xmax1
resL@trXMinF                = xmin1
 resL@pmLegendDisplayMode    = "Never"            ; Turn on drawing legend.
 resL@pmLegendDisplayMode    = "Always"            ; Turn on drawing legend.
 resL@pmLegendZone           = 0                   ; Change the location
 resL@pmLegendOrthogonalPosF = 0.10              ; of the legend
 resL@pmLegendParallelPosF =  0.10
 resL@lgLabelFontHeightF     = 0.020
 resL@lgJustification        = "BottomRight"
 resL@pmLegendWidthF         = 0.15                ; Change width and
 resL@pmLegendHeightF        = 0.15               ; height of legend.
 resL@pmLegendSide           = "Top"               ; Change location of
 resL@lgPerimOn              = False               ; legend and turn off
resL@xyExplicitLegendLabels = (/"D3Q27"/)

plot = gsn_csm_xy(wks,xx1,yy1,resL)

; polyres                   = True
; polyres@gsLineDashPattern = 0
; polyres@gsLineThicknessF = 0.5
; polyres@gsLineColor = "red"
; pline1 = gsn_add_polyline(wks,plot,(/xmin,xmax/),(/ysize,ysize/),polyres)

; draw(wks)
; frame(wks)

end
