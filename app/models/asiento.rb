class Asiento < ActiveRecord::Base
  belongs_to :ejercicio
  has_many :detalles

  validates_presence_of :fecha, :descripcion, :ejercicio

  attr_accessible :fecha, :descripcion, :ejercicio_id, :detalles_attributes

  accepts_nested_attributes_for :detalles
end

