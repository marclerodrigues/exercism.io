require './test/test_helper'

ENV['RACK_ENV'] = 'test'

require 'mongoid'

Mongoid.load!("./config/mongoid.yml")

module Mongoid
  def self.reset
    Mongoid.default_session.collections.each do |coll|
      coll.drop unless coll.name == 'system.indexes'
    end
  end
end
