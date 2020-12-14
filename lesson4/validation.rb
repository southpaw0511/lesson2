module Validation
  def self.included(base)
    base.include(InstanceMethods)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_accessor :validates

    def validate(attr_name, *args)
      @validates ||= []
      @validates << [attr_name, args]
    end
  end

  module InstanceMethods
    def validate!
      self.class.validates.each do |validation|
        val = instance_variable_get("@#{validation[0][0]}")
        send(val)
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(name, *args)
      value = instance_variable_get("@#{name}")
      raise 'Name is blank!' if value.empty? || value.nil?
    end

    def format(name, *args)
      raise 'Incorrect format!' if name !~ args[0]
    end

    def type(name, *args)
      raise 'Type error!' if name.class != args[0]
    end
  end
  
end