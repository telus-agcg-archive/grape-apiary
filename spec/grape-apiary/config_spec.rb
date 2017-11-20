require 'spec_helper'

describe GrapeApiary::Config do
  include_context 'configuration'

  subject { GrapeApiary::Config }

  it 'allows for host to be set' do
    subject.host = host

    expect(subject.host).to eq(host)
  end

  it 'allows for name to be set' do
    subject.name = name

    expect(subject.name).to eq(name)
  end

  it 'allows for description to be set' do
    subject.description = description

    expect(subject.description).to eq(description)
  end

  context '.include_root' do
    it 'defaults to false' do
      expect(subject.include_root).to be(false)
    end

    it 'allows for inclusion of the root to be set' do
      subject.include_root = true

      expect(subject.include_root).to eq(true)
    end
  end

  context 'headers' do
    %i(request_headers response_headers).each do |type|
      context type do
        it 'is an array' do
          expect(subject.send(type)).to be_a(Array)
        end

        it 'allows for request headers to be set in bulk' do
          headers = send(type)

          subject.send("#{type}=", headers)

          expect(subject.send(type)).to eq(headers)
        end

        it 'allows for request headers to be set individually' do
          header = { Host: 'api.connexiolabs-qa.com' }

          expect do
            subject.send(type) << header
          end.to change { subject.send(type).length }.by(1)
        end
      end
    end
  end

  context 'sample id generation' do
    it 'allows for setting the type for id generation' do
      subject.example_id_type = :uuid

      expect(subject.example_id_type).to eq(:uuid)
    end

    it 'guards against unsupported types' do
      expect do
        subject.example_id_type = :foo
      end.to raise_error(UnsupportedIDType)
    end

    it 'checks for the bson library if requested' do
      expect { subject.example_id_type = :bson }.to raise_error(BSONNotDefinied)
    end

    it 'generates a valid uuid' do
      test = /[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}/i

      subject.example_id_type = :uuid

      expect(subject.generate_id).to match(test)
    end

    it 'generates a valid integer' do
      test = /^[0-9]{1,10}$/

      subject.example_id_type = :integer

      expect(subject.generate_id.to_s).to match(test)
    end
  end
end
