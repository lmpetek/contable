class AddCentroCostoToDetalle < ActiveRecord::Migration
  def self.up
    add_column :detalles, :centro_costo_id, :integer
  end

  def self.down
    remove_column :detalles, :centro_costo_id
  end
end
