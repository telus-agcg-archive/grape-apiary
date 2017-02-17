module GrapeApiary
  class Route < SimpleDelegator
    # would like to rely on SimpleDelegator but Grape::Route uses
    # method_missing for these methods :'(
    delegate :namespace, :path, :request_method, to: '__getobj__'

    def params
      @params ||= begin
        __getobj__.params.stringify_keys.sort.map do |param|
          Parameter.new(self, *param)
        end
      end
    end

    def route_name
      namespace.split('/').last ||
        path.match('\/(\w*?)[\.\/\(]').captures.first
    end

    def description
      "#{__getobj__.description} [#{request_method.upcase}]"
    end

    def path_without_format
      path.gsub(/\((.*?)\)/, '')
    end

    def route_model
      namespace.split('/').last.singularize
    end

    def route_type
      list? ? 'collection' : 'single'
    end

    def request_description
      "+ Request #{'(application/json)' if request_body?}"
    end

    def response_description
      code = request_method == 'POST' ? 201 : 200

      "+ Response #{code} (application/json)"
    end

    def list?
      %w(GET POST).include?(request_method) && !path.include?(':id')
    end

    private

    def request_body?
      !%w(GET DELETE).include?(request_method)
    end
  end
end
