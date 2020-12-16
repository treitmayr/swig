#!/usr/bin/env ruby
#
# Check the availability of expected classes and their member variables.
#

require 'swig_assert'
require 'nested_scope'

Nested_scope::Global_.new
Nested_scope::Outer1.new
nested2 = Nested_scope::Outer1::Nested2.new
nested2.data = 42
swig_assert_equal("nested2.data", "42", binding)
Nested_scope::Klass.new

Nested_scope::Klass::Abstract_int
cannot_instantiate = false
begin
  Nested_scope::Klass::Abstract_int.new
rescue TypeError
  cannot_instantiate = true
end
swig_assert_simple(cannot_instantiate)

Nested_scope::Klass::Real.new.Method()
