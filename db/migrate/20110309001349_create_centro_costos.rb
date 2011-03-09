class CreateCentroCostos < ActiveRecord::Migration
  def self.up
    create_table :centro_costos do |t|
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
  end

  def self.down
    drop_table :centro_costos
  end
end
