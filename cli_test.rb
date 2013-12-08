# path =  'vlc -vvv /Users/cmackenzie/Desktop/simpsons/episode.m4v'
# exec path

cmd_arr = ['/Applications/VLC.app/Contents/MacOS/VLC',
           '-Idummy',
           '--video-filter',
           'scene',
           '-Vdummy',
           '--no-audio',
           '--scene-height=256',
           '--scene-width=512',
           '--scene-format=png',
           '--scene-ratio=1',
           '--start-time=10',
           '--stop-time=11',
           '--scene-prefix=thumb',
           '--scene-path=/Users/cmackenzie/Desktop/simpsons/output',
           '/Users/cmackenzie/Desktop/simpsons/episode.m4v',
           'vlc://quit']
cmd = cmd_arr.join(' ')
exec cmd