Dir.chdir(File.expand_path(File.dirname(__FILE__))){
  exec %{dtrace -Zvqs trace.d -c "ruby ex_channel.rb"}
}