class CreateDetalles < ActiveRecord::Migration
  def self.up
    create_table :detalles do |t|
      t.references :cuenta
      t.references :asiento
      t.string :descripcion
      t.decimal :debe
      t.decimal :haber

      t.timestamps
    end
  end

  def self.down
    drop_table :detalles
  end
end
