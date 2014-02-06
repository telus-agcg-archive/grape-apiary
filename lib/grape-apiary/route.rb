module GrapeApiary
  class Route < SimpleDelegator
    # would like to rely on SimpleDelegator but Grape::Route uses
    # method_missing for these methods :'(
    delegate :route_namespace, :route_path, :route_method, to: '__getobj__'

    def route_params
      @route_params ||= __getobj__.route_params.map do |param|
        Parameter.new(self, *param)
      end
    end

    def route_name
      route_namespace.split('/').last ||
        route_path.match('\/(\w*?)[\.\/\(]').captures.first
    end

    def route_description
      "#{__getobj__.route_description} [#{route_method.upcase}]"
    end

    def route_path_without_format
      route_path.gsub(/\((.*?)\)/, '')
    end

    def route_model
      route_namespace.split('/').last.singularize
    end

    def route_type
      list? ? 'collection' : 'single'
    end

    def request_description
      "+ Request #{'(application/json)' if request_body?}"
    end

    def response_description
      code = route_method == 'POST' ? 201 : 200

      "+ Response #{code} (application/json)"
    end

    private

    def list?
      route_method == 'GET' && !route_path.include?(':id')
    end

    def request_body?
      !%w(GET DELETE).include?(route_method)
    end
  end
end
