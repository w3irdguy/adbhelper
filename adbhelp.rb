require 'tty-prompt'
prompt = TTY::Prompt.new
loop do
  system "clear"
  system "echo '\033[91m'"
  system "figlet adbhelp"
  choices = [
    {name: 'uninstall app', value: 1},
    {name: 'list brute devices', value: 2},
    {name: 'list devices', value: 3},
    {name: 'connect with wifi', value: 4},
    {name: 'shell terminal', value: 5},
    {name: 'show logcat', value: 6},
    {name: 'clear logcat', value: 7},
    {name: 'install app', value: 8},
    {name: 'open link', value: 9},
    {name: 'go to home', value: 10},
    {name: 'open a app', value: 11},
    {name: 'print text', value: 12},
    {name: 'enter', value: 26},
    {name: 'delete', value: 27},
    {name: 'type text and enter', value: 28},
    {name: 'down brightness', value: 29},
    {name: 'up brightness', value: 31},
    {name: 'screenshot/printscreen', value: 13},
    {name: 'screenrecord', value: 14},
    {name: 'open camera', value: 15},
    {name: 'open contacts', value: 16},
    {name: 'turn off android', value: 17},
    {name: 'upload files', value: 18},
    {name: 'download files', value: 19},
    {name: 'start server', value: 20},
    {name: 'kill server', value: 21},
    {name: 'reboot system', value: 22},
    {name: 'reboot as system recovery', value: 23},
    {name: 'show android version', value: 24},
    {name: 'reset permissions from a app', value: 25},
    {name: 'exit from adbh', value: 30}
    ]
  cmd = prompt.select("Select an option!", choices)
  case cmd
    when 1
      print "type the app name(ex: com.myapp.app) > "
      app = gets.chomp
      system "adb uninstall #{app}"
      gets.chomp
    when 2
      system "adb devices"
      gets.chomp
    when 3
      system "adb devices -l"
      gets.chomp
    when 4
      print "type the IP adress(ex: 128.218.65.1) > "
      wifi = gets.chomp
      system "adb connect #{wifi}"
    when 5
      system "adb shell"
      gets.chomp
    when 6
      system "adb logcat"
      gets.chomp
    when 7
      system "adb logcat -c"
      gets.chomp
    when 8
      print "type the path(ex: /sdcard/Downloads/sonic.apk) > "
      ins = gets.chomp
      system "adb -e install #{ins}"
    when 9
      print "type the ulr/link(ex: https://google.com) > "
      url = gets.chomp
      system "adb shell am start -a android.intent.action.VIEW -d #{url}"
    when 10
      system "adb shell am start -W -c android.intent.category.HOME -a android.intent.action.MAIN
    "
    when 11
      print "type the app path(ex: com.android.app/com.MainActivity) > "
      pathh = gets.chomp
      system "adb shell am start --user 0 -n #{pathh}"
    when 12
      print "type your text(ex: my text) > "
      txt = gets.chomp
      system "adb shell input text '#{txt}'"
    when 13
      print "type the name of printscreen (ex: myscreenshot) > "
      prt = gets.chomp 
      system "adb shell screencap /sdcard/#{prt}.png"
      puts "Device Printed!"
      gets.chomp
    when 14
      print "type the name of record (ex: myrec) > "
      name = gets.chomp
      system "adb shell screenrecord /sdcard/#{name}.mp4"
    when 15
      system "adb shell input keyevent 27"
    when 16
      system "adb shell input keyevent 207"
    when 17
      system "adb shell input keyevent 26"
    when 18
      print "type the file path (ex: /sdcard/myfile.txt) > "
      file = gets.chomp
      print "type the destination path(ex: /home) > "
      dest = gets.chomp
      system "adb pull #{file} #{dest}"
    when 19
      print "type the file name (ex: myfile.txt) > "
      path = gets.chomp
      print "type the host path (ex: /sdcard) > "
      file = gets.chomp
      system "adb push #{path} #{file}"
    when 20
      system "adb start-server"
      gets.chomp
    when 21
      system "adb kill-server"
      gets.chomp
    when 22
      system "adb reboot"
    when 23
      system "adb reboot recovery"
    when 24
      system "adb shell getprop ro.build.version.release"
      gets.chomp
    when 25
      print "type the name of your app (ex: com.myapp.app) >"
      set = gets.chomp
      system "adb shell pm reset-permissions -p #{set}"
    when 26
      system "adb shell input keyevent 66"
    when 27
      system "adb shell input keyevent 67"
    when 28
      print "type your text (ex: my-text) > "
      text = gets.chomp
      system "sleep 5"
      system "adb shell input text '#{text}'"
      system "sleep 10"
      system "adb shell input keyevent 66"
    when 29
      system "adb shell input keyevent 220"
    when 31
      system "adb shell input keyevent 221"
    when 30
      print "\e[91m bye bye\e[0m"
      break
    end

rescue Exception => e
  puts "sele exit to quit"
end
