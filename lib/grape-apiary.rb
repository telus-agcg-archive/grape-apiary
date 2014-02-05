require 'grape'
require 'grape-apiary/version'
require 'grape-apiary/config'
require 'grape-apiary/blueprint'

module GrapeApiary
  extend self

  def config
    block_given? ? yield(Config) : Config
  end
end
