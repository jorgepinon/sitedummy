class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name
      t.string :domain
      t.references :site, index: true

      t.timestamps
    end
  end
end
