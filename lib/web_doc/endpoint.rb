class WebDoc::Endpoint
  attr_accessor :title, :path, :verb, :description, :incoming, :outgoing

  def initialize(verb, path, incoming, outgoing)
    @verb     = verb
    @path     = path
    @incoming = incoming || {}
    @outgoing = outgoing || {}

    @title       = ""
    @description = ""
  end

  def id
    title.gsub(" ", "_").downcase
  end

  def description(text = nil)
    @description = text if text
    @description
  end

  def title(text = nil)
    @title = text if text
    @title
  end

  def takes(type, param, description, options = {})
    @incoming[param] = { type: type, description: description, options: options }
  end

  def returns(type, param, description, options = {})
    @outgoing[param] = { type: type, description: description, options: options }
  end
end