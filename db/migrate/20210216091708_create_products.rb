class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.string  :name,          null: false
      t.string  :title,         null: false
      t.string  :code,          null: false
      t.integer :unit,          null: false, default: 0, limit: 1  # default: 'pc/шт.'
      t.string  :vendor_code,   null: false
      t.decimal :vendor_price,  null: false, default: 0
      t.decimal :price,         null: false, default: 0
      t.boolean :hot,                        default: false
      t.decimal :hot_price,     null: false, default: 0
      t.integer :quantity,      null: false, default: 0
      t.text    :abstract
      t.integer :position
      t.integer :status,    null: false, default: 0, limit: 1  # default: active
      t.string  :url,       null: false
      t.string  :seo_title, null: false
      t.text    :seo_description,        default: ''
      t.text    :seo_keywords,           default: ''

      t.timestamps
    end
    add_index :products, :name, unique: true
    add_index :products, :code, unique: true
  end
end
