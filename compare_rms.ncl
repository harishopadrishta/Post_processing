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
  file0 = "profile2_D3Q27_200_350.dat"
  file1 = "mean_vel_pipe.dat"
  file2 = "Loulou_PSM_rms_radial.dat"
  file3 = "Loulou_PSM_rms_streamwise.dat"
  file4 = "Loulou_PSM_rms_tangential.dat"
  file5 = "Wagnar_FV_radial_rms.dat"
  file6 = "Wagnar_FV_streamwise_rms.dat"
  file7 = "Wagnar_FV_tangential_rms.dat"

  n0 = 100
  n1 = 100
  n2 = 34
  n3 = 42
  n4 = 36
  n5 = 29
  n6 = 47
  n7 = 29

  data0 = asciiread(file0,(/n0,9/),"float")
  data1 = asciiread(file1,(/n1,14/),"float") 
  data2 = asciiread(file2,(/n2,2/),"float")
  data3 = asciiread(file3,(/n3,2/),"float")
  data4 = asciiread(file4,(/n4,2/),"float")
  data5 = asciiread(file5,(/n5,2/),"float")
  data6 = asciiread(file6,(/n6,2/),"float")
  data7 = asciiread(file7,(/n7,2/),"float")

  xx = new ((/12,101/),float)
  yy = new ((/12,101/),float)
  
  aH1 = 148.5
  visc = 0.0032
  ustar1 = 180.0*visc/aH1
  ystar = visc/ustar1

  xx(0,0:n0-1) = data0(0:n0-1,1)
  yy(0,0:n0-1) = sqrt(data0(0:n0-1,5))
    xx(0,n0) = 0
  yy(0,n0) = 0
  xx(1,0:n0-1) = data0(0:n1-1,1)
  yy(1,0:n0-1) = sqrt(data0(0:n1-1,3))
    xx(1,n0) = 0
  yy(1,n0) = 0
  xx(2,0:n0-1) = data0(0:n0-1,1)
  yy(2,0:n0-1) = sqrt(data0(0:n0-1,6))
    xx(2,n0) = 0
  yy(2,n0) = 0
  xx(3,0:n1-1) = data1(0:n1-1,1)
  yy(3,0:n1-1) = data1(0:n1-1,10)
   xx(3,n0) = 0
  yy(3,n0) = 0
  xx(4,0:n0-1) = data1(0:n0-1,1)
  yy(4,0:n0-1) = data1(0:n0-1,8)
  xx(4,n0) = 0
  yy(4,n0) = 0
  xx(5,0:n1-1) = data1(0:n1-1,1)
  yy(5,0:n1-1) = data1(0:n1-1,11)
  xx(5,n0) = 0
  yy(5,n0) = 0
  xx(6,0:n2-1) = (1 - data2(0:n2-1,0))*aH1/ystar
  yy(6,0:n2-1) = data2(0:n2-1,1)
  xx(7,0:n3-1) = (1 -data3(0:n3-1,0))*aH1/ystar
  yy(7,0:n3-1) = data3(0:n3-1,1)
  xx(8,0:n4-1) = (1 - data4(0:n4-1,0))*aH1/ystar
  yy(8,0:n4-1) = data4(0:n4-1,1)
  xx(9,0:n5-1) = (1- data5(0:n5-1,0))*aH1/ystar
  yy(9,0:n5-1) = data5(0:n5-1,1)
  xx(10,0:n6-1) = (1-data6(0:n6-1,0))*aH1/ystar
  yy(10,0:n6-1) = data6(0:n6-1,1)
  xx(11,0:n7-1) = (1-data7(0:n7-1,0))*aH1/ystar
  yy(11,0:n7-1) = data7(0:n7-1,1)

  ymax = 3.5
  ymin = 0.0
  xmin = 0.0
  xmax = 180.0

;************************************************
; create plot
;************************************************

 wks   = gsn_open_wks ("pdf", "compare_rmsprofiles")      ; open workstation
; wks   = gsn_open_wks ("x11", "flux" )        ; open workstation

res   = True
res@xyMarkLineModes     = (/"Lines","Lines","Lines","Lines","Lines","Lines","Markers","Markers","Markers","Markers","Markers","Markers"/)
res@xyMarkers           = (/15,15,15,7,7,7,4,4,4,3,3,3/)             ; choose type of marker
res@xyMarkerSizes       = (/0.008/)               ; Marker size (default 0.006)
res@xyMarkerColors       = (/"red","blue","black","red","blue","black","red","blue","black","red","blue","black"/)
res@xyLineColors       = (/"red","blue","black","red","blue","black","red","blue","black","red","blue","black"/)
res@xyMonoLineThickness = False
res@xyDashPatterns = (/0,0,0,1,1,1/)
res@xyLineThicknesses   = (/3.,3.,3.,3.,3.,3./)

res@gsnFrame               = False                       ; don't draw yet
res@gsnDraw              = False


res@vpXF                   = 0.18
res@vpYF                   = 0.98
res@vpHeightF              = 0.70
res@vpWidthF              = 0.80

; res@trYLog     = True                            ; change y-axis to log
; res@trXLog     = True                            ; change y-axis to log
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
 res@pmLegendOrthogonalPosF = 0.5                 ; of the legend
 res@pmLegendParallelPosF =  0.5
 res@lgLabelFontHeightF     = 0.015
 res@lgJustification        = "TopRight"
 res@pmLegendWidthF         = 0.20                ; Change width and
 res@pmLegendHeightF        = 0.30                ; height of legend.
 res@pmLegendSide           = "Top"            ; Change location of
 res@lgPerimOn              = False               ; legend and turn off
                                                  ; the perimeter.
res@xyExplicitLegendLabels = (/"ur_D3Q27","uy_D3Q27","ut_D3Q27","ur_D3Q19","uy_D3Q19","ut_D3Q19","ur_Loulou","uy_Loulou","ut_Loulou","ur_Wagner","uy_Wagner","ut_Wagner"/)

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

