module GrapeApiary
  class SampleGenerator
    attr_reader :resource

    delegate :unique_params, to: :resource

    def initialize(resource)
      @resource = resource
    end

    def sample
      @sample ||= begin
        array = resource.unique_params.map do |resource|
          [resource.name, resource.example]
        end

        Hash[array]
      end
    end

    def request
      return unless sample.present?

      # format json spaces for blueprint markdown
      JSON.pretty_generate(sample)
        .gsub('{', (' ' * 14) + '{')
        .gsub('}', (' ' * 14) + '}')
        .gsub(/\ {2}\"/, (' ' * 16) + '"')
    end

    def response
      return unless sample.present?

      hash = sample.reverse_merge(id: GrapeApiary::Config.generate_id)
      # sample = [sample] if list?(route)

      # format json spaces for blueprint markdown
      JSON.pretty_generate(hash)
        .gsub('[', (' ' * 12) + '[')
        .gsub(']', (' ' * 12) + ']')
        .gsub('{', (' ' * 14) + '{')
        .gsub('}', (' ' * 14) + '}')
        .gsub(/\ {2}\"/, (' ' * 16) + '"')
    end
  end
end
