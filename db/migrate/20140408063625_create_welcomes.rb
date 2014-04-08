class CreateWelcomes < ActiveRecord::Migration
  def change
    create_table :welcomes do |t|
      t.text :heading
      t.text :message

      t.timestamps
    end
  end
end
