require 'web_doc/builder'
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
    self.load_docs
  end

  def self.load_docs
    Dir[File.expand_path("#{@@input}/**/*_doc.rb")].each { |f| require f }
  end

  def self.build_html(mod)
    WebDoc::Builder.new(mod, @@output).build!
  end
end