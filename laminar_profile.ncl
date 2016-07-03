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

; case II.1
  file1 = "profiles0002000.dat"
  file2 = "profiles0004000.dat"
  file3 = "profiles0006000.dat"
  file4 = "profiles0008000.dat"
  file5 = "profiles0010000.dat"

 
  n1 = 40

  data1 = asciiread(file1,(/n1,13/),"float")
  data2 = asciiread(file2,(/n1,13/),"float")
  data3 = asciiread(file3,(/n1,13/),"float")
  data4 = asciiread(file4,(/n1,13/),"float")
  data5 = asciiread(file5,(/n1,13/),"float")

  aH = 40.0
  ucl = 0.05

  xx = new((/2,n1/),float)
  yy = new((/2,n1/),float)

  xx(0,0:n1-1) = 0.0
  xx(1,0:n1-1) = 0.0
;  xx(2,0:n1-1) = data1(0:n1-1,2)
;  xx(3,0:n1-1) = data1(0:n1-1,12)
;  xx(4,0:n1-1) = data2(0:n1-1,2)
;  xx(5,0:n1-1) = data2(0:n1-1,12)
;  xx(6,0:n1-1) = data3(0:n1-1,2)
;  xx(7,0:n1-1) = data3(0:n1-1,12)
;  xx(8,0:n1-1) = data4(0:n1-1,2)
;  xx(9,0:n1-1) = data4(0:n1-1,12)
;  xx(10,0:n1-1) = data5(0:n1-1,2)
;  xx(11,0:n1-1) = data5(0:n1-1,12)

  yy(0,0:n1-1) = data1(0:n1-1,0)/aH
  yy(1,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(2,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(3,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(4,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(5,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(6,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(7,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(8,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(9,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(10,0:n1-1) = data1(0:n1-1,0)/aH
;  yy(11,0:n1-1) = data1(0:n1-1,0)/aH

   ymax = 1.05
   ymin = -0.05 
   xmin = -0.05
   xmax = 1.05

;************************************************
; create plot
;************************************************

wks   = gsn_open_wks ("pdf", "channel_velocity_profile_laminar")     ; open workstation

res   = True
res@xyMarkLineModes     = (/"Markers","Lines","Markers","Lines","Markers","Lines","Markers","Lines","Markers","Lines","Markers","Lines"/)
res@xyMarkers           = (/3,3,3,3,3,3,3,3/)
res@xyMarkerSizes       = (/0.009,0.009,0.009,0.009,0.009,0.009,0.009/)
res@xyMarkerColors     = (/"black","black","black","black","black","black","black","black","black","black","black","black","black","black"/)
res@xyLineColors       = (/"red","red","red","red","red","red","red","red","red","red","red","red"/)
res@xyMonoLineThickness = False
res@xyDashPatterns = (/0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,1,0,1,0,0,1,0,1,0/)
res@xyLineThicknesses   = (/2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2.,2./)
res@gsnFrame               = False                       ; don't draw yet
res@gsnDraw              = False

res@vpXF                   = 0.15
res@vpYF                   = 0.95
res@vpHeightF              = 0.70
res@vpWidthF              = 0.80

; res@trYLog     = True                            ; change y-axis to log
; res@trXLog     = True                            ; change y-axis to log
; res@tmYLMode      = "a"                   ; Define tick mark labels.
; res@tmYLValues    = (/0.01,0.1,1.0,10./)
; res@tmYLLabels    = (/0.01,0.1,1.0,10./)
; res@tmYLMinorOn   = True                        ; No minor tick marks.

; res@tmYLMinorPerMajor = 8
; res@tmYRMinorPerMajor = 8

 res@tmXTMinorPerMajor = 8
 res@tmXBMinorPerMajor = 8

;res@tiXAxisString       = "y+" ; x-axis label
;res@tiYAxisString       = "u/u_max"          ; y-axis label
; res@gsnMaximize         = True
; res@gsnPaperOrientation    ="auto"
res@trYMaxF                = ymax
res@trYMinF                = ymin
res@trXMaxF                = xmax
res@trXMinF                = xmin

 res@pmLegendDisplayMode    = "Never"            ; Turn on drawing legend.
 res@pmLegendDisplayMode    = "Always"            ; Turn on drawing legend.
 res@pmLegendZone           = 0                   ; Change the location
 res@pmLegendOrthogonalPosF = -0.0              ; of the legend
 res@pmLegendParallelPosF =  0.05  
 res@lgLabelFontHeightF     = 0.020
 res@lgJustification        = "Top"
 res@pmLegendWidthF         = 0.20                ; Change width and
 res@pmLegendHeightF        = 0.25                ; height of legend.
 res@pmLegendSide           = "Top"               ; Change location of
 res@lgPerimOn              = False               ; legend and turn off
                                                  ; the perimeter.
res@xyExplicitLegendLabels = (/"D3Q27","Analytical results"/)

plot  = gsn_csm_xy (wks,xx,yy,res)          ; create plot

 polyres                   = True
 polyres@gsLineDashPattern = 0
 polyres@gsLineThicknessF = 0.5
 polyres@gsLineColor = "red"
;pline1 = gsn_add_polyline(wks,plot,(/xmin,xmax/),(/ysize,ysize/),polyres)

 opt                     = True
 opt@NumberLegenItems    = 2 
draw(wks)
frame(wks)

end
