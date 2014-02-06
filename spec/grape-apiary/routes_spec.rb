require 'spec_helper'

describe GrapeApiary::Routes do
  include_context 'configuration'

  before do
    GrapeApiary.config do |config|
      config.host        = host
      config.name        = name
      config.description = description
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

  it 'aggregates routes at the resource level' do
    route_names = subject.routes.map(&:name).uniq

    expect(subject.resources.keys).to eq(route_names)
  end
end
