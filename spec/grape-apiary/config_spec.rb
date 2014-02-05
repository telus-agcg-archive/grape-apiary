require 'spec_helper'

describe GrapeApiary::Config do
  include_context 'configuration'

  it 'allows for host to be set' do
    GrapeApiary::Config.host = host

    expect(GrapeApiary::Config.host).to eq(host)
  end

  it 'allows for name to be set' do
    GrapeApiary::Config.name = name

    expect(GrapeApiary::Config.name).to eq(name)
  end

  it 'allows for description to be set' do
    GrapeApiary::Config.description = description

    expect(GrapeApiary::Config.description).to eq(description)
  end
end
