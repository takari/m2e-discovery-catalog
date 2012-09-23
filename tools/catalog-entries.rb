#!/usr/bin/env ruby

# Gems
require 'mustache'
require 'rexml/document'
include REXML

catalog0 = Document.new(File.new(ARGV[0]))
catalog1 = Document.new(File.new(ARGV[1]))

entries0 = XPath.match(catalog0, 'catalog/catalogItems/catalogItem')
entries0.sort! { |a,b| a.elements['id'].text <=> b.elements['id'].text }
puts entries0.length

entries0.each do |entry|
  puts entry.elements['id']
end

entries1 = XPath.match(catalog1, 'catalog/catalogItems/catalogItem')
entries1.sort! { |a,b| a.elements['id'].text <=> b.elements['id'].text }
puts entries1.length

entries1.each do |entry|
  puts entry.elements['id']
end



