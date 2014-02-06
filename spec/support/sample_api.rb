class SampleApi < Grape::API
  resource 'widgets' do
    desc 'widgets list'
    get  '/' do
    end

    desc 'individual widget'
    get ':id' do
    end

    desc 'create a widget'
    params do
      requires :name, type: 'string', desc: 'the widgets name'
      optional :description, type: 'string', desc: 'the widgets name'
    end
    post '/' do
    end

    desc 'update a widget'
    params do
      optional :name, type: 'string', desc: 'the widgets name'
      optional :description, type: 'string', desc: 'the widgets name'
    end
    put  ':id' do
    end
  end

  resource 'admin' do
    get '/' do
    end
  end
end
