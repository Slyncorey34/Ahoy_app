class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.decimal :cost
      t.text :note
      t.string :origin
      t.string :destination
      t.references :boats, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
