#!/usr/bin/env ruby
puts 'rake resque:work QUEUE=* run this command to test'
require 'resque'
require 'redis'

class Dict
   def build_dict
      allwords = File.open('/usr/share/dict/words').readlines;
      allwords.each do |w| $dict.set w.strip, 0 end
      $dict.save
   end
end
  
class SpellChecker 
   def self.perform word
      puts "word #{word} is wrong" unless $dict.get(word) 
   end
end


$dict = Redis.new
create = false     # make this true in order to create the dictionary
Dict.new.build_dict if create
words_all = %w{new movie tiiii} 
words_all.each do |word|
#	Resque.enque(SpellChecker, word)
 SpellChecker.perform word
end

