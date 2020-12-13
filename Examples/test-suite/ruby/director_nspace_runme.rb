#!/usr/bin/env ruby

require 'swig_assert'
require 'director_nspace'


class MyBarFoo < Director_nspace::TopLevel::Bar::Foo
  def ping
    return "MyBarFoo.ping()";
  end

  def fooBar(p_fooBar)
    p_fooBar.FooBarDo;
  end

  def makeFoo
    Director_nspace::TopLevel::Bar::Foo.new
  end

  def makeFooBar
    Director_nspace::TopLevel::Bar::FooBar.new
  end

end


barFoo = Director_nspace::TopLevel::Bar::Foo.new
myBarFoo = MyBarFoo.new


swig_assert_equal("barFoo.ping", '"Bar::Foo::ping()"', binding)
swig_assert_equal("myBarFoo.ping", '"MyBarFoo.ping()"', binding)
swig_assert_equal("barFoo.pong", '"Bar::Foo::pong();Bar::Foo::ping()"', binding)
swig_assert_equal("myBarFoo.pong", '"Bar::Foo::pong();MyBarFoo.ping()"', binding)

swig_assert_equal("Director_nspace::TopLevel::Bar::Foo.get_self(myBarFoo).class", 'MyBarFoo', binding)
swig_assert_equal("MyBarFoo.get_self(myBarFoo).class", 'MyBarFoo', binding)

swig_assert_equal('barFoo.makeFoo.class', 'myBarFoo.makeFoo.class', binding)
swig_assert_equal('barFoo.makeFooBar.class', 'myBarFoo.makeFooBar.class', binding)
