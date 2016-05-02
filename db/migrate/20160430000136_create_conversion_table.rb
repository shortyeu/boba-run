class CreateConversionTable < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :yelp_id
      t.decimal :medium_to_large
      t.boolean :tax_included
      t.decimal :tax_rate

      t.timestamps
    end
  end
end
