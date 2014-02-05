module GrapeApiary
  class Generator
    def generate
      ERB.new(template).result(binding)
    end

    def write
    end

    private
    def template
      @template ||= File.read('./lib/grape-apiary/templates/blueprint.md.erb')
    end

    def binding
      @binding ||= Binding.new.get_binding
    end
  end

  class Binding
    extend Forwardable

    delegate [:host, :name, :description] => 'GrapeApiary::Config'

    def get_binding
      binding
    end

    def resources
      @resources ||= []
    end
  end
end
