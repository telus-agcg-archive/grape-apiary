require 'spec_helper'

describe GrapeApiary::Blueprint do
  include_context 'configuration'

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

  subject { GrapeApiary::Blueprint.new(SampleApi) }

  context '#generate' do
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

    it 'includes properties for the resources' do
      expect(subject).to include('Properties')
    end
  end

  it 'exposes configuration settings' do
    GrapeApiary::Config::SETTINGS.each do |setting|
      expect(subject.send(setting)).to eq(GrapeApiary.config.send(setting))
    end
  end

  it 'exposes the raw routes of the given api' do
    expect(subject.routes).to eq(SampleApi.routes)
  end

  context '#resources' do
    let(:unique_routes) { subject.routes.map(&:route_name).uniq }

    let(:included_routes) do
      unique_routes.reject do |name|
        GrapeApiary.config.resource_exclusion.include?(name.to_sym)
      end
    end

    it 'aggregates routes into resources' do
      expect(subject.resources.first).to be_a(GrapeApiary::Resource)
    end

    it 'excluded resources based on configuration' do
      expect(subject.resources.map(&:key)).to eq(included_routes)
    end
  end
end
