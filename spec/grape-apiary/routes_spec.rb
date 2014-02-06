require 'spec_helper'

describe GrapeApiary::Routes do
  include_context 'configuration'

  before do
    GrapeApiary.config do |config|
      config.host               = host
      config.name               = name
      config.description        = description
      config.resource_exclusion = [:admin]
    end
  end

  subject { GrapeApiary::Routes.new(SampleApi) }

  it 'exposes configuration settings' do
    GrapeApiary::Config::SETTINGS.each do |setting|
      expect(subject.send(setting)).to eq(GrapeApiary.config.send(setting))
    end
  end

  it 'exposes the raw routes of the given api' do
    expect(subject.routes).to eq(SampleApi.routes)
  end

  context '#resources' do
    let(:unique_routes) { subject.routes.map(&:name).uniq }

    let(:included_routes) do
      unique_routes.reject do |name|
        GrapeApiary.config.resource_exclusion.include?(name.to_sym)
      end
    end

    it 'aggregates routes into resources' do
      expect(subject.resources.first).to be_a(GrapeApiary::Resource)
    end

    it 'excluded resources based on configuration' do
      expect(subject.resources.map(&:name)).to eq(included_routes)
    end
  end
end
