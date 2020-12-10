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
        send("#{validation[1][0]}", validation[0], validation[1])
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
      raise 'Name is blank!' if name.empty? || name.nil?
    end

    def format(name, *args)
      raise 'Incorrect format!' if name !~ args[0]
    end

    def type(name, *args)
      raise 'Type error!' if name.class != args[0]
    end
end