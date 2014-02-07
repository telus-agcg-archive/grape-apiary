require 'spec_helper'

describe GrapeApiary::SampleGenerator do
  include_context 'configuration'

  before do
    GrapeApiary.config do |config|
      config.host               = host
      config.name               = name
      config.description        = description
    end
  end

  let(:blueprint) { GrapeApiary::Blueprint.new(SampleApi) }
  let(:resource)  { blueprint.resources.first }

  subject { GrapeApiary::SampleGenerator.new(resource) }
end
