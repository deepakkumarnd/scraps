# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "load files to execute"

load('./main.rb')      # code is loaded for execution
load('./main.rb',true) # loaded into an anonymous module


# Load configuration if any
if conf.rc and File.exists?( conf.rc )
    YAML.load_file(conf.rc).each do |k,v|
    conf.send("#{k}=" , v)
  end
end
