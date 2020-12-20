#!/usr/bin/env ruby
#
# This test implementation is directly derived from its Java counterpart.
#

require 'swig_assert'
require 'nspace'

# preprocessor macros (constants)
swig_assert_equal('Nspace::CONSTANT100', '100', binding)
swig_assert_equal('Nspace::CONSTANT200', '200', binding)
swig_assert_equal('Nspace::CONSTANT300', '300', binding)

# constructors and destructors
color1 = Nspace::Outer::Inner1::Color.new
color = Nspace::Outer::Inner1::Color.new(color1)
color1 = nil
GC.start

# class methods
color.colorInstanceMethod(20.0)
Nspace::Outer::Inner1::Color.colorStaticMethod(20.0)
created = Nspace::Outer::Inner1::Color.create

# class enums
someClass = Nspace::Outer::SomeClass.new
channel = someClass.GetInner1ColorChannel
swig_assert_equal('channel', 'Nspace::Outer::Inner1::Color::Transmission', binding)

# class anonymous enums
val1 = Nspace::Outer::Inner1::Color::ColorEnumVal1
val2 = Nspace::Outer::Inner1::Color::ColorEnumVal2
swig_assert_equal('val1', '0', binding)
swig_assert_equal('val2', '0x22', binding)

# instance member variables
color.instanceMemberVariable = 123
swig_assert_equal('color.instanceMemberVariable', '123', binding)

# static member variables
Nspace::Outer::Inner1::Color.staticMemberVariable = 789
swig_assert_equal('Nspace::Outer::Inner1::Color.staticMemberVariable', '789', binding)
swig_assert_equal('Nspace::Outer::Inner1::Color::StaticConstMemberVariable', '222', binding)
swig_assert_equal('Nspace::Outer::Inner1::Color::StaticConstEnumMemberVariable', 'Nspace::Outer::Inner1::Color::Transmission', binding)
Nspace::Outer::Inner1::Color::InsideColor.staticMemberVariable = 789
swig_assert_equal('Nspace::Outer::Inner1::Color::InsideColor.staticMemberVariable', '789', binding)

# same class different namespaces
col1 = Nspace::Outer::Inner1::Color.new
col2 = Nspace::Outer::Inner2::Color.create
col2.colors(col1, col1, col2, col2, col2)

# check globals in a namespace
Nspace::Outer::Inner1.namespaceFunction(color)
Nspace::Outer::Inner1.namespaceVar = 111
swig_assert_equal('Nspace::Outer::Inner1.namespaceVar', '111', binding)
swig_assert_equal('Nspace::Outer::Inner1::namespaceVarConst', '1', binding)

swig_assert_equal('Nspace.noNamespaceVar', '5', binding)
Nspace.noNamespaceVar = 112
swig_assert_equal('Nspace.noNamespaceVar', '112', binding)
swig_assert_equal('Nspace.noNamespaceVarConst', '6', binding)

# global enums
outerChannel1 = someClass.GetInner1Channel()
swig_assert_equal('outerChannel1', 'Nspace::Outer::Inner1::Transmission1', binding)
outerChannel2 = someClass.GetInner2Channel()
swig_assert_equal('outerChannel2', 'Nspace::Outer::Inner2::Transmission2', binding)

# turn feature off / ignoring
ns = Nspace::Outer::Namespce.new
nons = Nspace::NoNSpacePlease.new
swig_assert_equal('Nspace::NoNSpacePlease.noNspaceStaticFunc()', '10', binding)
swig_assert_equal('Nspace::NoNSpacePlease::NoNspace2', '10', binding)
swig_assert_equal('Nspace::NoNSpacePlease::ReallyNoNspace2', '10', binding)

# derived class
blue3 = Nspace::Outer::Inner3::Blue.new
blue3.blueInstanceMethod
blue4 = Nspace::Outer::Inner4::Blue.new
blue4.blueInstanceMethod

Nspace::Individual1.inamespaceVar = 5
swig_assert_equal('Nspace::Individual1.inamespaceVar', '5', binding)
swig_assert_equal('Nspace::Individual2.inamespaceVarConst', '1', binding)
swig_assert_equal('Nspace::Individual2.respond_to?(:inamespaceVarConst=)', 'false', binding)
swig_assert_equal('Nspace::Individual3.inamespaceFunction(22)', '23', binding)
swig_assert_equal('Nspace::Individual4::C', '2', binding)

Nspace::Yin::SomeClazz.new

