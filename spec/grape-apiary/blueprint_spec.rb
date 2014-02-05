require 'spec_helper'

describe GrapeApiary::Blueprint do
  include_context 'configuration'

  context '#generate' do
    before do
      GrapeApiary.config do |config|
        config.host        = host
        config.name        = name
        config.description = description
      end
    end

    subject() { GrapeApiary::Blueprint.new.generate }

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
  end
end
