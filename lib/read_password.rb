#!/usr/bin/env ruby

require 'rubygems'
require 'highline/import'

def read_password(prompt="Password:", mask = '*')
    ask(prompt){ |q| q.echo = mask }
end

password = read_password
puts password

