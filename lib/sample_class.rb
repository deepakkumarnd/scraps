# This code explains how to create a class in ruby.
# It is better if you follow the naming conventions.
# If you use the same name for a class and its file name
# it is easy to find the module in your source code.
# Better keep one class in a single file.

class SampleClass
  def initialize
    
  end
end


class MyClass; end




# adding new features to class

class MyClass
  def mymethod
    puts "mymethod"
  end
end

obj = MyClass.new
obj.instance_variable_set("@x" , 10)