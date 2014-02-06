module GrapeApiary
  class SampleGenerator
    attr_reader :resource

    def initialize(resource)
      @resource = resource
    end

    def sample
    end

    def request
      {}.to_json
    end

    def response
      {}.to_json
    end
  end
end
