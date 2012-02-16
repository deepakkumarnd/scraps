#!/usr/bin/env ruby

require 'fileutils'

def backup(from_dir, to_dir, time_format = "%d_%m_%Y")
    raise Exception unless Dir.exists?(from_dir)
    Dir.mkdir(to_dir) unless Dir.exists?(to_dir)
    path , name = File.split(File.absolute_path(from_dir))
    to = name+'_'+Time.now.strftime(time_format)+'.zip'
    ans = nil
    flag = nil
    if File.exists?("#{to_dir}/#{to}") 
        loop{
            puts "#{to} already exists in #{File.absolute_path(to_dir)}. Do you want to replace(Yes/No):"
            ans = STDIN.gets.chomp.downcase
            break if ['yes','y','no','n'].include? ans
        }
        flag = !( ans == 'yes' || ans == 'y') 
    end
    system("zip -r #{to} #{from_dir} > /dev/null") unless flag
    FileUtils.mv(to, to_dir) unless flag
end


if ARGV.length != 2
    puts 'usage: ./dir_backup dir backup_dir'
else
    backup(ARGV.first, ARGV.last)
end
        

