require 'web_doc/documentable'
require 'web_doc/endpoint'
require 'web_doc/version'

require 'pry'

module WebDoc
  @@input  = ""
  @@output = ""

  def self.input=(input)
    @@input = input
  end

  def self.input
    @@input
  end

  def self.output=(output)
    @@output = output
  end

  def self.output
    @@output
  end

  def self.config
    yield self
  end
end
