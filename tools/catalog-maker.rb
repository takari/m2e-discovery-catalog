#!/usr/bin/env ruby

# Gems
require 'mustache'
require 'rexml/document'
include REXML

template = File.open('connectors.mustache').read
catalogItems = []

Dir.glob("*/catalog.xml").each { |file|    
  puts "Procesing #{file}..."
  catalog = Document.new(File.new(file))
  catalog.elements.each('catalog/catalogItems/catalogItem') do |catalogItem|
    catalogItems << catalogItem
  end  
}
  
connectors = Mustache.render(template, :catalogItems => catalogItems)  
  
File.open("connectors.xml", 'w') { |f| 
  f.write(connectors) 
}


