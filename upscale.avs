# This line causes all filters that don't have an MT mode explicitly use mode 2 by default.
# Mode 2 is a relatively safe choice until you don't know most of your calls to be either mode 1 or 3.
# Compared with mode 1, mode 2 trades memory for MT-safety, but only a select few filters will work with mode 1.
SetFilterMTMode("DEFAULT_MT_MODE", 1)

Function nrJinc36Resize(clip input, int "target_width", int "target_height", float "src_left", float "src_top", float "src_width", float "src_height"){
  
  Assert( input.IsPlanar(), "nrJinc36Resize: only planar color spaces are supported!" )
  
  target_width  = Default( target_width,   width(input) )
  target_height = Default( target_height, height(input) )
  src_left      = Default( src_left,                  0 )
  src_top       = Default( src_top,                   0 )
  src_width     = Default( src_width,                 0 )
  src_height    = Default( src_height,                0 )
  
  return input.Jinc36Resize(target_width, target_height, src_left, src_top, src_width, src_height)
  \           .Repair(input.GaussResize(target_width, target_height, src_left, src_top, src_width, src_height, p=100), 1)
  
}

RawSourcePlus("raw.yuv", width=640, height=480, fpsnum=30)
nnedi3_rpow2(rfactor=4, cshift="Spline36Resize") # If you have JincResize AVS plugin installed (32bit avisynth only) you can change this to use nrJinc36Resize above for slightly better quality at the cost of processing speed

Prefetch(8) # 8 threads, I use 8 on my 4-core PC, I don't know if that's bad but it seems to convert the fastest :)
