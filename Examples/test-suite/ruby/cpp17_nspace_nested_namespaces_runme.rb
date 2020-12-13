#!/usr/bin/env ruby
#
# This test implementation is directly derived from its Java counterpart.
#

require 'cpp17_nspace_nested_namespaces'

Cpp17_nspace_nested_namespaces::A1::A1Struct.new.A1Method
Cpp17_nspace_nested_namespaces::A1::B1::B1Struct.new.B1Method
Cpp17_nspace_nested_namespaces::A1::B1::C1::C1Struct.new.C1Method

Cpp17_nspace_nested_namespaces::A1::B1::createA1Struct().A1Method
Cpp17_nspace_nested_namespaces::A1::B1::createB1Struct().B1Method
Cpp17_nspace_nested_namespaces::A1::B1::C1::createC1Struct().C1Method

Cpp17_nspace_nested_namespaces::A2::B2::B2Struct.new.B2Method
Cpp17_nspace_nested_namespaces::A2::B2::C2::C2Struct.new.C2Method
Cpp17_nspace_nested_namespaces::A2::B2::createB2Struct().B2Method
Cpp17_nspace_nested_namespaces::A2::B2::C2::createC2Struct().C2Method

Cpp17_nspace_nested_namespaces::A3::B3::B3Struct.new.B3Method
Cpp17_nspace_nested_namespaces::A3::B3::C3::C3Struct.new.C3Method
Cpp17_nspace_nested_namespaces::A3::B3::createB3Struct().B3Method
Cpp17_nspace_nested_namespaces::A3::B3::C3::createC3Struct().C3Method
