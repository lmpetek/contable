class CreateAsientos < ActiveRecord::Migration
  def self.up
    create_table :asientos do |t|
      t.string :descripcion
      t.date :fecha
      t.references :ejercicio

      t.timestamps
    end
  end

  def self.down
    drop_table :asientos
  end
end
