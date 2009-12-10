#!/usr/bin/ruby

require 'rubygems'
require 'optiflag'

module Opts extends OptiFlagSet
end

fps = 5
transformer = "mogrify"
codec = "-ovc x264 -x264encopts bitrate=3000"
encoder = "mencoder mf://*.JPG -mf fps=#{fps.to_s} -o #{output_filename}.mp4 #{codec}"
#enc = "ffmpeg -f image2 -i P%07d.JPG -r #{fps.to_s} -s WxH -vcodec libx264 -vpre default -b 3000k -f mp4 moving_movie.mp4"
player = "mplayer"

def playback
  playback_cmd = "#{player} mf://#{firstframe} -mf fps=#{fps.to_s}"
end

def resize
  resize_cmd = "#{transformer} -resize #{dimentions}"
end

def rename
end

def offline
end

private

def firstframe
  filename = `ls -1 | head -n 1`
end

