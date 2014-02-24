module GrapeApiary
  class SampleGenerator
    attr_reader :resource, :root

    delegate :unique_params, to: :resource

    def initialize(resource)
      @resource = resource
      @root     = resource.key.singularize
    end

    def sample(id = false)
      array = resource.unique_params.map do |param|
        next if param.name == root

        [param.name, param.example]
      end

      hash = Hash[array.compact]

      hash = hash.reverse_merge(id: Config.generate_id) if id
      hash = { root => hash } if Config.include_root

      hash
    end

    def request
      hash = sample

      return unless hash.present?

      # format json spaces for blueprint markdown
      JSON.pretty_generate(hash)
        .gsub('{', (' ' * 14) + '{')
        .gsub('}', (' ' * 14) + '}')
        .gsub(/\ {2}\"/, (' ' * 16) + '"')
    end

    def response(list = false)
      hash = sample(true)

      return unless hash.present?

      hash = [hash] if list

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
