module WebDoc::Documentable
  attr_accessor :title, :description, :base_path, :endpoints, :common_returns,
                :common_takes

  def common_takes
    @common_takes ||= {}
  end

  def common_returns
    @common_returns ||= {}
  end

  def endpoints
    @endpoints ||= []
  end

  def id
    title.gsub(" ", "_").downcase
  end

  def set(variable, value)
    send("#{variable.to_s}=", value)
  end

  def add_common_take(type, param, description, options = {})
    common_takes[param] = {
      type:        type,
      description: description,
      options:     options
    }
  end

  def add_common_return(type, param, description, options = {})
    common_returns[param] = {
      type:        type,
      description: description,
      options:     options
    }
  end

  [:get, :post, :put, :patch, :delete, :options].each do |verb|
    define_method verb do |suffix, &block|
      endpoint = WebDoc::Endpoint.new(verb, build_path(suffix), common_takes.dup, common_returns.dup)
      block.call(endpoint)
      endpoints << endpoint
    end
  end

  private

  def build_path(suffix)
    @base_path + suffix
  end
end