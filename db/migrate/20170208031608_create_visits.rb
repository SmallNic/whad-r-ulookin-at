class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.references :domain, foreign_key: true
      t.references :visitor, foreign_key: true
      t.string :url
      t.string :browser
      t.boolean :new_visit

      t.timestamps
    end
  end
end
