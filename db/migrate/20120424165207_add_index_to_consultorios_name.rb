class AddIndexToConsultoriosName < ActiveRecord::Migration
  def change
    add_index :consultorios, :name, unique: true
  end
end
