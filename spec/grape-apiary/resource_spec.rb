require 'spec_helper'

describe GrapeApiary::Resource do
  include_context 'configuration'

  subject { GrapeApiary::Resource.new('foo', []) }

  context 'sample' do
    it 'request generation is delegated to a generator' do
      expect(subject.sample_generator).to receive(:request)

      subject.sample_request
    end

    it 'response generation is delegated to a generator' do
      expect(subject.sample_generator).to receive(:response)

      subject.sample_response(GrapeApiary::Route.new(Grape::Route.new))
    end
  end
end
