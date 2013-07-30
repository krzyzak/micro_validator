require "micro_validator/errors"
require "micro_validator/version"

module MicroValidator
  module ClassMethods
    def validation_methods
      @validation_methods ||= []
    end

    def validate(method_name)
      validation_methods << method_name
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end

  def valid?
    errors.clear
    result = true
    self.class.validation_methods.each do |validation_method|
      output &= self.send(validation_method)
    end
    result && errors.empty?
  end

  def errors
    @errors ||= Errors.new
  end
end
