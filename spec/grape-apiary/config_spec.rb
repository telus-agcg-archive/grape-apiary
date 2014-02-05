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

  context 'headers' do
    [:request_headers, :response_headers].each do |type|

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
end
