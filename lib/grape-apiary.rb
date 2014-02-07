require 'grape'
require 'grape-apiary/version'
require 'grape-apiary/config'
require 'grape-apiary/parameter'
require 'grape-apiary/sample_generator'
require 'grape-apiary/route'
require 'grape-apiary/resource'
require 'grape-apiary/blueprint'

module GrapeApiary
  module_function

  def config
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
