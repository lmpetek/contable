class Detalle < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :asiento
  belongs_to :centro_costo
  validates_presence_of :cuenta
  
  def validate
      errors.add(:haber, "debe cargar un importe") if haber.nil?||debe.nil?||debe+haber <= 0
      
  end
end
