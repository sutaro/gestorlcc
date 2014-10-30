class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :identificador
      t.string :password
      t.string :nombre
      t.string :apellidos
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
