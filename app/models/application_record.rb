class ApplicationRecord < ActiveRecord::Base
  require "active_storage"
  self.abstract_class = true
end
