class Asiento < ActiveRecord::Base
  belongs_to :ejercicio
  has_many :detalles

  validates_presence_of :fecha, :descripcion

  attr_accessible :fecha, :descripcion, :detalles_attributes

  accepts_nested_attributes_for :detalles
end

