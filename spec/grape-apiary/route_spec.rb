require 'spec_helper'

describe GrapeApiary::Route do
  include_context 'configuration'

  let(:routes) { GrapeApiary::Blueprint.new(SampleApi).routes }

  subject { routes.first }

  it 'adds a name helper to routes' do
    expect(subject.route_name).to eq('widgets')
  end

  it 'adds a path helper without format' do
    expect(subject.route_path_without_format).to eq('/widgets')
  end

  it 'adds a type helper' do
    expect(subject.route_type).to eq('collection')
  end
end
