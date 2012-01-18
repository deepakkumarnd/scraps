# To change this template, choose Tools | Templates
# and open the template in the editor.

puts "Meta Programming"

# dynamically creating attributes of a class

class Dynamicattr
  def initialize
    @attributes = {}
  end

  def method_missing( name_sy, *args)
    name = name_sy.to_s
    if name =~ /=$/
      @attributes[name.chop] = args[0]
    else
      @attributes[name]
    end
  end
end


