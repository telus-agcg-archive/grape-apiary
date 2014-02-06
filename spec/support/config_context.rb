shared_context 'configuration' do
  let(:resource_exclusion) { [:admin, :swagger_docs] }

  let(:request_headers)  do
    [
      { 'Accept-Charset' => 'utf-8' },
      { 'Connection'     => 'keep-alive' },
      { 'Content-Type'   => 'application/json' }
    ]
  end

  let(:response_headers) do
    [
      { 'Content-Length' => '21685' },
      { 'Connection'     => 'keep-alive' },
      { 'Content-Type'   => 'application/json' }
    ]
  end
end
