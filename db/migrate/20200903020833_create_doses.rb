class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.references :cocktails
      t.references :ingredients


      t.timestamps
    end
  end
end
