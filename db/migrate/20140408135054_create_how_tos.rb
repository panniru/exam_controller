class CreateHowTos < ActiveRecord::Migration
  def change
    create_table :how_tos do |t|
      t.string :name
      t.text :description
      t.float :fee

      t.timestamps
    end
  end
end
