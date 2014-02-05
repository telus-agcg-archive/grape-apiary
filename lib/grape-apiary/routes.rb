module GrapeApiary
  class Routes
    extend Forwardable

    delegate [:host, :name, :description] => 'GrapeApiary::Config'

    def resources
      @resources ||= []
    end

    def routes_binding
      binding
    end
  end
end
