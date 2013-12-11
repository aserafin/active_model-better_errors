require "coveralls"
Coveralls.wear! do
  add_filter "/spec/"
end

require "pry"
require "rspec"
require "active_model"
require "active_model/better_errors"

require_relative "support/models"

class String
  def ==(other)
    if other.is_a? ActiveModel::ErrorCollecting::ErrorMessage
      super other.to_s
    else
      super
    end
  end
end
