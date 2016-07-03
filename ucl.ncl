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

  file1 = "ucl.dat"

  n1 = 200


  data1 = asciiread(file1,(/n1,3/),"float")
  aH = 40.0
  Re = 20.0
  ustar = 0.05
  visc = (ustar*aH)/Re


  xx = new((/2,n1+1/),float)
  yy = new((/2,n1+1/),float)
  
  xx(0,0) = 0.0
  xx(1,0) = 0.0
  yy(0,0) = 0.0
  yy(1,0) = 0.0
  xx(0,1:n1) = (data1(0:n1-1,0)*visc)/(aH*aH)
  xx(1,1:n1) = (data1(0:n1-1,0)*visc)/(aH*aH)
  yy(0,1:n1) = data1(0:n1-1,1)  
  yy(1,1:n1) = data1(0:n1-1,2)

   ymax1 = 1
   ymin1 = 0
   xmin1 = 0.
   xmax1 = 1.4  


;************************************************
; create plot
;************************************************

 wks   = gsn_open_wks ("pdf", "centerline_velocity")      ; open workstation
;wks   = gsn_open_wks ("x11", "flux" )        ; open workstation


; resources for "left" variable
resL                        = True 
resL@xyMarkLineModes     = (/"Markers","Lines"/)
resL@xyMarkers           = (/5, 2/)             ; choose type of marker
resL@xyMarkerSizes       = (/0.01, 0.01/)               ; Marker size (default 0.01)
resL@xyMarkerColors       = (/"red","black"/)
resL@xyLineColors       = (/"red","black","blue","blue","purple","black","black","black","red","red","red"/)
resL@xyMonoLineThickness = False
resL@xyDashPatterns = (/0,0,0,1,2,0,1,0,1,2,3/)
resL@xyLineThicknesses   = (/1.,2.,2.,2.,2.,1.,1.,1.,1./)
resL@vpXF                   = 0.15
resL@vpYF                   = 0.75
resL@vpHeightF              = 0.50
resL@vpWidthF              = 0.70
resL@tiXAxisString       = "" ; x-axis label
resL@tiYAxisString       = "" ; y-axis label
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
resL@xyExplicitLegendLabels = (/"D3Q27","Analytical results"/)

plot = gsn_csm_xy(wks,xx,yy,resL)

; polyres                   = True
; polyres@gsLineDashPattern = 0
; polyres@gsLineThicknessF = 0.5
; polyres@gsLineColor = "red"
; pline1 = gsn_add_polyline(wks,plot,(/xmin,xmax/),(/ysize,ysize/),polyres)

; draw(wks)
; frame(wks)

end
