class Cuenta < ActiveRecord::Base
  validates_presence_of :nombre, :codigo
end

