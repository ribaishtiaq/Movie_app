class CreateWatches < ActiveRecord::Migration[5.2]
  def change
    create_table :watches do |t|
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
