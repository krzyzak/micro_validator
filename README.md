µValidator
===============

Zero dependency, dead simple validation library.


Usage
========

```
require "micro_validator"


class Foo
  validate :bar
  validate :baz
  
  private
  def bar
   errors.add(:attribute, "Attribute is wrong") if attribute == "Wrong"
  end
  
  def baz
    false # Always fails
  end
end

@foo = Foo.new
@foo.valid? # => false

```
