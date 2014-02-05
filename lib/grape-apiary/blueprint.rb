module GrapeApiary
  class Blueprint
    attr_reader :api_class, :template, :binding

    def initialize(api_class)
      @api_class = api_class
      @template  = File.read('./lib/grape-apiary/templates/blueprint.md.erb')
      @binding   = Routes.new(api_class).routes_binding
    end

    def generate
      ERB.new(template).result(binding)
    end

    def write
    end
  end
end
