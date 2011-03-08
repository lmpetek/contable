class Detalle < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :asiento
end
