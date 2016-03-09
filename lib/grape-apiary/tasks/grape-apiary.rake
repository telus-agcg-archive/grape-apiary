namespace :ga do
  desc 'Produce documentation'
  task docs: :environment do
    api = ENV['API'] || ARGV[1]
    raise 'You must provide the name of an API to document' if api.nil?
    begin
      api_class = Object.const_get(api)
      api_docs = GrapeApiary::Blueprint.new(api_class).generate
      output_file = 'docs/grape-apiary.md'
      File.open(output_file, 'w') { |file| file.write(api_docs) }
    rescue NameError
      raise "#{api} has not been defined as a Grape API"
    end
  end
end
