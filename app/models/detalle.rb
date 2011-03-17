class Detalle < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :asiento
  belongs_to :centro_costo
  validates_presence_of :cuenta
  validates_associated :asiento
  
  def validate
      errors.add(:haber, "debe cargar un importe") if (haber.nil? && debe.nil?)
      errors.add(:debe, "debe cargar un importe")  if ((!haber.nil? && haber<0) || (!debe.nil? && debe<0))
  end
end
