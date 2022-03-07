# frozen_string_literal: true
require 'csv'
require 'rails/all'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
