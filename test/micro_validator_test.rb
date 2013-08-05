require "test_helper"
require "micro_validator"

class MyKlass
  include MicroValidator

private

  def testing
    errors.add(:testing, "Something failed...")
  end

  def another
    errors.add(:testing, "Another failure!")
  end

  def different_field
    errors.add(:different_field, "It's different this time.")
  end

  def successful
    (5 > 1) ? true : errors.add(:comparison, "5 is less than 1!")
  end
end

module MicroValidator
  class MicroValidatorTest < Minitest::Test
    def setup
      @klass = MyKlass.new
      MyKlass.validation_methods.clear
    end

    def test_should_not_pass_validation
      MyKlass.validate(:testing)
      MyKlass.validate(:successful)
      assert !@klass.valid?
    end

    def test_should_pass_validation
      MyKlass.validate(:successful)
      @klass.valid?
    end
  end
end
