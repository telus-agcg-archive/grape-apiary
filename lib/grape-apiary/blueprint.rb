module GrapeApiary
  class Blueprint
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
      @binding ||= Routes.new.routes_binding
    end
  end
end
