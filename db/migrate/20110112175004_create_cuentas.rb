class CreateCuentas < ActiveRecord::Migration
  def self.up
    create_table :cuentas do |t|
      t.string :nombre
      t.string :codigo
      t.boolean :ajustada

      t.timestamps
    end
  end

  def self.down
    drop_table :cuentas
  end
end
