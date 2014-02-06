require 'spec_helper'

describe GrapeApiary::Routes do
  include_context 'configuration'

  let(:routes) { GrapeApiary::Routes.new(SampleApi).routes }

  subject { routes.first }

  it 'adds a name helper to routes' do
    expect(subject.name).to eq('widgets')
  end
end
