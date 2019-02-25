class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :avatar
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
