class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def self.contains(column_name, search_value)
    where("lower(#{column_name}) like ?","%#{search_value.downcase}%" )
  end
end
