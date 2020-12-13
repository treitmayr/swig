#!/usr/bin/env ruby
#
# This test implementation is directly derived from its Java counterpart.
#

require 'swig_assert'
require 'template_nested'

Template_nested::T_NormalTemplateNormalClass.new.tmethod(Template_nested::NormalClass.new)
Template_nested::OuterClass.new.T_OuterTMethodNormalClass(Template_nested::NormalClass.new)

tf = Template_nested::TemplateFuncs.new
swig_assert_equal("tf.T_TemplateFuncs1Int(-10)", "-10", binding)
swig_assert_equal("tf.T_TemplateFuncs2Double(-12.3)", "-12.3", binding)

tn = Template_nested::T_NestedOuterTemplateDouble.new
swig_assert_equal("tn.hohum(-12.3)", "-12.3", binding)

inner1 = Template_nested::OuterClass.new.useInner1(Template_nested::OuterClass::T_OuterClassInner1Int.new)
inner2 = Template_nested::OuterClass::T_OuterClassInner2NormalClass.new
inner2.embeddedVar = 2
inner22 = Template_nested::OuterClass.new.useInner2Again(inner2)
inner3 = Template_nested::OuterClass::T_OuterClassInner1Double.new
