class CreateNours < ActiveRecord::Migration[5.0]
  def change
    create_table :nours do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
