# This code explains how to create a module in ruby.
# It is better if you follow the naming conventions.
# If you use the same name for a module and its file name
# it is easy to find the module in your source code.
# Better keep one class in a single file.


module SampleModule

    module NestedModule
      ConstantInsideModule = 4
      SampleModule::ClassInsideModule::ConstantInsideClass
      Module.nesting
    end

    class ClassInsideModule
       ConstantInsideClass = 10
       module ModuleInsideClass
         X = 10
       end
    end

end
