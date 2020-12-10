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
        send("validate_#{validation[1][0]}", validation[0], validation[1])
      end
    end

    def valid?
      validate!
      true
    rescue RuntimeError
      false
    end

    protected

    def presence(attr_name, _args)
      value = instance_variable_get("@#{attr_name}")
      raise ArgumentError, 'Empty string or nil' if value.nil? || value == ''
    end 

    def format(attr_name, args)
      raise ArgumentError, 'Regex not passed' if args[1].nil?
      raise ArgumentError, 'Regex mismatch' unless instance_variable_get("@#{attr_name}") =~ args[1]
    end

    def type(attr_name, args)
      value = instance_variable_get("@#{attr_name}")
      raise ArgumentError, 'Class name not passed' if args[1].nil?
      raise TypeError, 'Variable type mismatch' unless value.instance_of?(args[1]) || value.instance_of?(args[-1])
    end
end