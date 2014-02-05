require 'grape'
require 'grape-apiary/version'
require 'grape-apiary/config'
require 'grape-apiary/routes'
require 'grape-apiary/blueprint'

module GrapeApiary
  module_function

  def config
    block_given? ? yield(Config) : Config
  end
end
