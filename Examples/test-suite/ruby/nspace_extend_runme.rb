#!/usr/bin/env ruby
#
# This test implementation is directly derived from its Java counterpart.
#

require 'swig_assert'
require 'nspace_extend'

# constructors and destructors
color1 = Nspace_extend::Outer::Inner1::Color.new
color = Nspace_extend::Outer::Inner1::Color.new(color1)
color1 = nil
GC.start

# class methods
color.colorInstanceMethod(20.0)
Nspace_extend::Outer::Inner1::Color.colorStaticMethod(20.0)
created = Nspace_extend::Outer::Inner1::Color.create

# constructors and destructors
color2 = Nspace_extend::Outer::Inner2::Color.new
color = Nspace_extend::Outer::Inner2::Color.new(color2)
color2 = nil
GC.start

# class methods
color.colorInstanceMethod(20.0)
Nspace_extend::Outer::Inner2::Color.colorStaticMethod(20.0)
created = Nspace_extend::Outer::Inner2::Color.create

# Same class different namespaces
col1 = Nspace_extend::Outer::Inner1::Color.new
col2 = Nspace_extend::Outer::Inner2::Color.create
col2.colors(col1, col1, col2, col2, col2)
