require 'slim'

module WebDoc
  class Builder
    attr_accessor :mod, :output, :title

    def initialize(mod, output)
      raise "Builder must be initialized with a module" unless mod.class == Module

      @css_assets_dir = File.expand_path("../../assets/css", __FILE__)

      @mod     = mod
      @output  = output
      @title   = "WebDoc Generated API Documentation"
    end

    def build!
      Dir.mkdir(@output) unless File.exists?(@output)
      # Dir.mkdir(@css_out) unless File.exists?(@css_out)

      File.open("#{@output}/index.html", "w+") do |f|
        f.write(render)
      end

      copy_css
    end

    private

    def copy_css
      FileUtils.cp_r(@css_assets_dir, @output)
    end

    def root_template
      @root_template ||= File.expand_path("../../assets/index.slim", __FILE__)
    end

    def render
      Slim::Template.new(root_template).render(self)
    end
  end
end