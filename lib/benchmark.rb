# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Benchmark"


require 'benchmark'

Benchmark.bm do |b|
  b.report "This is benchmark report" do
    1000.times do
      # your code goes here
    end
  end
end
