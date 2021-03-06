module MicroValidator
  class Errors
    def add(attribute, message)
      errors[attribute] ||= []
      errors[attribute] << message
    end

    def clear
      @errors = {}
    end

    def empty?
      errors.empty?
    end

    def all
      @errors
    end

    def field(name)
      @errors[name]
    end

  private
    def errors
      @errors ||= {}
    end
  end
end
