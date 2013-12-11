require 'rmagick'
require 'srt'
include Magick

def run  
  subs = SRT::File.parse(File.new("s07e01.srt"))  
  
  line = subs.lines[4..-1].sample #getting rid of some non-quote subs with the 3..-1  

  p line.text
  p line.start_time
  p line.end_time
  
  cmd = ['/Applications/VLC.app/Contents/MacOS/VLC',
         '-Idummy',
         '--video-filter',
         'scene',
         '-Vdummy',
         '--no-audio',
         '--scene-height=256',
         '--scene-width=512',
         '--scene-format=png',
         '--scene-ratio=2',
         "--start-time=#{line.start_time}",
         "--stop-time=#{line.end_time}",
         '--scene-prefix=thumb',
         '--scene-path=/Users/cmackenzie/Desktop/projects/simpsons',
         '/Users/cmackenzie/Desktop/projects/simpsons/s07e01.m4v',
         'vlc://quit'].join(' ')
  system(cmd)
  
  @file = "00001"
  
  deleteFile until File.zero?(fileName)
  
  deleteFile while File.zero?(fileName)

  animation = ImageList.new(*Dir["*.png"])
  animation.write("animated.gif")
  
  deleteFile while File.exists?(fileName)
  
end

def fileName
  "thumb#{@file}.png"
end

def deleteFile
  File.delete(fileName)
  @file.next!.next!
end

run