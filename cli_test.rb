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
         '--scene-ratio=1',
         "--start-time=#{rando}",
         "--stop-time=#{rando + 2}",
         '--scene-prefix=thumb',
         '--scene-path=/Users/cmackenzie/Desktop/projects/simpsons',
         '/Users/cmackenzie/Desktop/projects/simpsons/episode.m4v',
         'vlc://quit'].join(' ')
  system(cmd)

  file = "00001"

  p fileName(file)
  # while File.exists?("thumb" + file + ".png")
  #   File.delete("thumb" + file + ".png") if File.zero?("thumb" + file + ".png")
  #   file.next!
  #   p file
  # end

  # 
  # animation = ImageList.new(*Dir["*.png"])
  # animation.delay = 10
  # animation.write("animated.gif")
end

def fileName(num)
  "thumb" + num + ".png"
end

run