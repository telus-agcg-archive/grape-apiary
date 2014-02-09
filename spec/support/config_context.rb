shared_context 'configuration' do
  let(:host)               { 'http://grape-apiary.apiary.io' }
  let(:name)               { 'some api v1' }
  let(:description)        { 'some blueprint description' }
  let(:resource_exclusion) { [:admin, :swagger_docs] }

  let(:request_headers) do
    [{ 'Accept-Charset' => 'utf-8' }]
  end

  let(:response_headers) do
    [{ 'Connection'     => 'keep-alive' }]
  end
end
