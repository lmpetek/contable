class CreateEjercicios < ActiveRecord::Migration
  def self.up
    create_table :ejercicios do |t|
      t.string :descripcion
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end

  def self.down
    drop_table :ejercicios
  end
end
