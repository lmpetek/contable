class CentroCosto < ActiveRecord::Base
  validates_presence_of :nombre, :codigo
  has_many :detalles
end
