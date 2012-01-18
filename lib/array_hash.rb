# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Array Hash"

arr =[:aab, :aac, :asdsd,:fdfdfds ]

arr.delete_if { |item| item =~ /^aa/  }