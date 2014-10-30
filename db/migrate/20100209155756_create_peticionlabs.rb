class CreatePeticionlabs < ActiveRecord::Migration
  def self.up
    create_table :peticionlabs do |t|
      t.text :diasemana
      t.text :horaini
      t.text :horafin

      t.timestamps
    end
  end

  def self.down
    drop_table :peticionlabs
  end
end
