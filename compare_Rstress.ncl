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
  file0 = "profile_D3Q27_350_500.dat"
  file1 = "mean_stress_pipe.dat"
  file2 = "Loulou_PSM_Reynolds_stress.dat"
  file3 = "Wagnar_FV_Reynolds_stress.dat"

  n0 = 100
  n1 = 100
  n2 = 52
  n3 = 45  

  data0 = asciiread(file0,(/n0,8/),"float")
  data1 = asciiread(file1,(/n1,8/),"float") 
  data2 = asciiread(file2,(/n2,2/),"float")
  data3 = asciiread(file3,(/n3,2/),"float")
  xx = new ((/5,n0/),float)
  yy = new ((/5,n0/),float)
  
  aH = 50.0
  visc = 0.0032
  ustar1 = 180.*visc/aH
  yplus = aH/180
  xx(0,0:n0-1) = data0(0:n0-1,0)
  yy(0,0:n0-1) = data0(0:n0-1,6)
  xx(1,0:n1-1) = data1(0:n1-1,0)
  yy(1,0:n1-1) = data1(0:n1-1,6)
  xx(2,0:n2-1) = data2(0:n2-1,0)
  yy(2,0:n2-1) = data2(0:n2-1,1)
  xx(3,0:n3-1) = data3(0:n3-1,0)
  yy(3,0:n3-1) = data3(0:n3-1,1)
  xx(4,0:n2-1) = data2(0:n2-1,0)
  yy(4,0:n2-1) = data2(0:n2-1,0)

  ymax = 1.0
  ymin = 0.0
  xmin = 0.0
  xmax = 1.0

;************************************************
; create plot
;************************************************

 wks   = gsn_open_wks ("pdf", "compare_rstressprofiles")      ; open workstation
; wks   = gsn_open_wks ("x11", "flux" )        ; open workstation

res   = True
res@xyMarkLineModes     = (/"Lines","Lines","Lines","Lines","Lines","Lines","Lines","Lines"/)
res@xyMarkers           = (/16,16,16,16,16/)             ; choose type of marker
res@xyMarkerSizes       = (/0.006,0.006,0.006/)               ; Marker size (default 0.006)
res@xyMarkerColors       = (/"red","blue","black","black"/)
res@xyLineColors       = (/"red","blue","black","magenta4","black","dark green","brown1","yellow"/)
res@xyMonoLineThickness = False
res@xyDashPatterns = (/1,1,1,1,0,1,1,1/)
res@xyLineThicknesses   = (/3.,3.,3.,3.,2.,2.,2.,2./)

res@gsnFrame               = False                       ; don't draw yet
res@gsnDraw              = False


res@vpXF                   = 0.18
res@vpYF                   = 0.98
res@vpHeightF              = 0.70
res@vpWidthF              = 0.80

; res@trYLog     = True                            ; change y-axis to log
;  res@trXLog     = True                            ; change y-axis to log
; res@tmYLMode      = "a"                   ; Define tick mark labels.
; res@tmYLValues    = (/0.01,0.1,1.0,10./)
; res@tmYLLabels    = (/0.01,0.1,1.0,10./)
; res@tmYLMinorOn   = True                        ; No minor tick marks.

; res@tmYLMinorPerMajor = 13
; res@tmYRMinorPerMajor = 13

;res@tmXTMinorPerMajor = 13
;res@tmXBMinorPerMajor = 13

res@tiXAxisString       = "" ; x-axis label
res@tiYAxisString       = ""          ; y-axis label
; res@gsnMaximize         = True
; res@gsnPaperOrientation    ="auto"
res@trYMaxF                = ymax
res@trYMinF                = ymin
res@trXMaxF                = xmax
res@trXMinF                = xmin

 res@pmLegendDisplayMode    = "Never"            ; Turn on drawing legend.
 res@pmLegendDisplayMode    = "Always"            ; Turn on drawing legend.
 res@pmLegendZone           = 0                   ; Change the location
 res@pmLegendOrthogonalPosF = 0.0                 ; of the legend
 res@pmLegendParallelPosF =  0.0
 res@lgLabelFontHeightF     = 0.015
 res@lgJustification        = "BottomRight"
 res@pmLegendWidthF         = 0.20                ; Change width and
 res@pmLegendHeightF        = 0.20                ; height of legend.
 res@pmLegendSide           = "Bottom"            ; Change location of
 res@lgPerimOn              = False               ; legend and turn off
                                                  ; the perimeter.
res@xyExplicitLegendLabels = (/"D3Q27","D3Q19","Loulou_PSM","Wagner_FV",""/)

plot  = gsn_csm_xy (wks,xx,yy,res)          ; create plot



 polyres                   = True
 polyres@gsLineDashPattern = 0
 polyres@gsLineThicknessF = 1.0
 polyres@gsLineColor = "red"
; pline1 = gsn_add_polyline(wks,plot,(/xmin,xmax/),(/15.74, 15.74/),polyres)
 polyres@gsLineColor = "blue"
; pline2 = gsn_add_polyline(wks,plot,(/xmin,xmax/),(/15.92, 15.92/),polyres)
; pline3 = gsn_add_polyline(wks,plot,(/20.61,20.61/),(/ymin,ymax/),polyres)
; pline4 = gsn_add_polyline(wks,plot,(/41.6,41.6/),(/ymin,ymax/),polyres)

draw(wks)
frame(wks)

end

