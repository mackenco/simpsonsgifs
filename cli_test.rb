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

  until File.zero?(fileName(@file))
    File.delete(fileName(@file))
    @file.next!.next!
  end
  
  while File.zero?(fileName(@file))
    File.delete(fileName(@file))
    @file.next!.next!
  end
  
  animation = ImageList.new(*Dir["*.png"])
  # animation.delay = 0
  animation.write("animated.gif")
  
  while File.exists?(fileName(@file))
    File.delete(fileName(@file))
    @file.next!.next!
  end
  
end

def fileName
  "thumb" + @file + ".png"
end

def processFile
  File.delete(fileName(@file))
  @file.next!.next!
end

run