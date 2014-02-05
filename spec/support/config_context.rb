shared_context 'configuration' do
  let(:host)             { 'http://grape-apiary.apiary.io' }
  let(:name)             { 'some api v1' }
  let(:description)      { 'some blueprint description' }

  let(:request_headers)  {
    [
      { 'Accept-Charset' => 'utf-8' },
      { 'Connection'     => 'keep-alive' },
      { 'Content-Type'   => 'application/json' }
    ]
  }

  let(:response_headers) {
    [
      { 'Content-Length' => '21685' },
      { 'Connection'     => 'keep-alive' },
      { 'Content-Type'   => 'application/json' }
    ]
  }
end
