class Detalle < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :asiento
  belongs_to :centro_costo
  validates_presence_of :cuenta
  
  def validate
      errors.add(:haber, "debe cargar un importe") if (haber.nil? || (haber<0 && (debe.nil?||debe<0)))
      errors.add(:debe, "debe cargar un importe") if (debe.nil? || (debe<0 && (haber.nil?||haber<0)))
  end
end
