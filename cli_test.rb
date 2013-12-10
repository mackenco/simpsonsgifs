require 'rmagick'
include Magick

def run
  rando = Random.new.rand * 1000
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
         "--start-time=#{rando}",
         "--stop-time=#{rando + 3}",
         '--scene-prefix=thumb',
         '--scene-path=/Users/cmackenzie/Desktop/projects/simpsons',
         '/Users/cmackenzie/Desktop/projects/simpsons/episode.m4v',
         'vlc://quit'].join(' ')
  system(cmd)

  @file = "00001"

  until File.zero?(fileName)
    processFile
  end
  
  while File.zero?(fileName)
    processFile
  end
  
  animation = ImageList.new(*Dir["*.png"])
  animation.write("animated.gif")
  
  while File.exists?(fileName)
    processFile
  end
  
end

def fileName
  "thumb#{@file}.png"
end

def processFile
  File.delete(fileName)
  @file.next!.next!
end

run