require 'rmagick'
include Magick

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
       '--scene-path=/Users/cmackenzie/Desktop/simpsons/output',
       '/Users/cmackenzie/Desktop/simpsons/episode.m4v',
       'vlc://quit'].join(' ')
exec cmd

animation = ImageList.new("/Users/cmackenzie/Desktop/simpsons/output/thumb00030.png")
animation.display