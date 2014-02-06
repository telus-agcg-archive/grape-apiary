module GrapeApiary
  module RouteDescriber
    def name
      route_namespace.split('/').last ||
        route_path.match('\/(\w*?)[\.\/\(]').captures.first
    end
  end
end

Grape::Route.send(:include, GrapeApiary::RouteDescriber)
