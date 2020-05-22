class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :shorted_url, null: true
      t.string :web_title
      t.integer :visits, null: false, default: 0

      t.timestamps
      t.index([:shorted_url], unique: true, name: 'by_short_url_unique')
    end
  end
end
