class Action < Struct.new(:name, :options); end

class Base
  
  @@before_action_chain = []

  class << self
    
    attr_accessor :before_action_chain

    def before_action(action, options = {})
      options = if options.empty?
        {}
      elsif options.has_key? :only
        { :only => options[:only] }
      elsif options.has_key? :except
        { :except => options[:except] }
      else
        {}
      end 

      action = Action.new(action, options)

      @@before_action_chain.push(action)
    end
  end

  def run_action(action, params)
    @params = params

    @@before_action_chain.each do |act|
      if act.options[:only]&.include? action 
        send(act.name)
      elsif act.options[:except]&.include? action
      else
        send(action.name)
      end
    end

    send(action)
  end
end

class Parent < Base 

  attr_accessor :name

  before_action :sanitize_name!, only: [:update]

  def update
    puts "Updated name is #{@params[:name]}"
  end

  def sanitize_name!
    @params[:name] = @params[:name]&.split&.map(&:capitalize)&.join(' ')
  end

end


p = Parent.new
p.run_action(:update, { name: 'deEpak kumaR' })
