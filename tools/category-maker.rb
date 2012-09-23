#!/usr/bin/env ruby

# Gems
require 'mustache'
require 'rexml/document'
include REXML

project = ARGV[0]
pom = Document.new(File.new(ARGV[0] + '/pom.xml'))
artifactId = XPath.first(pom, 'project/artifactId').text.sub('parent', 'feature')
version = XPath.first(pom, 'project/version').text.sub('-SNAPSHOT', '')
repositoryPathId = XPath.first(pom, 'project/properties/repositoryPathId').text
p2MetadataName = XPath.first(pom, 'project/properties/p2MetadataName').text

template = File.open('category.mustache').read
category = Mustache.render(template, :version => version, 
                                     :repositoryPathId => repositoryPathId, 
                                     :p2MetadataName => p2MetadataName,
                                     :artifactId => artifactId)  
  
File.open(project + '/' + artifactId + '/category.xml', 'w') { |f| 
  f.write(category) 
}


