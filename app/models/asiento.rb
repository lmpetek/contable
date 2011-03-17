class Asiento < ActiveRecord::Base
  belongs_to :ejercicio
  has_many :detalles

  validates_presence_of :fecha, :descripcion, :ejercicio

  attr_accessible :fecha, :descripcion, :ejercicio_id, :detalles_attributes

  accepts_nested_attributes_for :detalles
  
  def validate
    @total_debe = 0
    @total_haber = 0 
    self.detalles.each do |detalle|
        @total_debe  += detalle.debe unless detalle.debe.nil?
        @total_haber += detalle.haber unless detalle.haber.nil?
     end
     errors.add(:descripcion, "debe estar balanceado") unless (@total_debe == @total_haber)
  end
end

