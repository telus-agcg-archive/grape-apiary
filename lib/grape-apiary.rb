require 'active_support/all' # rubocop:disable Naming/FileName
require 'grape'

module GrapeApiary
  autoload :Version,         'grape-apiary/version'
  autoload :Config,          'grape-apiary/config'
  autoload :Parameter,       'grape-apiary/parameter'
  autoload :SampleGenerator, 'grape-apiary/sample_generator'
  autoload :Route,           'grape-apiary/route'
  autoload :Resource,        'grape-apiary/resource'
  autoload :Blueprint,       'grape-apiary/blueprint'

  def self.config
    block_given? ? yield(Config) : Config
  end
end

class UnsupportedIDType < StandardError
  def message
    'Unsupported id type, supported types are [integer, uuid, bson]'
  end
end

class BSONNotDefinied < StandardError
  def message
    'BSON type id requested but bson library is not present'
  end
end
