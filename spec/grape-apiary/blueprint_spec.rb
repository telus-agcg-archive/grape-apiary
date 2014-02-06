require 'spec_helper'

describe GrapeApiary::Blueprint do
  include_context 'configuration'

  context '#generate' do
    before do
      GrapeApiary.config do |config|
        config.host               = host
        config.name               = name
        config.description        = description
        config.resource_exclusion = [:admin]
      end

      GrapeApiary.config.request_headers = [
        { 'Accept-Charset' => 'utf-8' },
        { 'Connection'     => 'keep-alive' }
      ]

      GrapeApiary.config.response_headers = [
        { 'Content-Length' => '21685' },
        { 'Connection'     => 'keep-alive' }
      ]
    end

    let(:klass) { SampleApi }

    subject { GrapeApiary::Blueprint.new(klass).generate }

    it 'sets the format to 1A' do
      expect(subject).to include('1A')
    end

    it 'sets the host based on configuration' do
      expect(subject).to include("HOST: #{host}")
    end

    it 'creates a header from configuration' do
      expect(subject).to include("# #{name}")
    end

    it 'adds the description' do
      expect(subject).to include(description)
    end

    it 'includes groups for each resource' do
      expect(subject).to include('# Group Widgets')
    end
  end
end
