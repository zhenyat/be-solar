class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string  :name,      null: false
      t.string  :title,     null: false
      t.text    :abstract,  null: false, default: ''
      t.integer :position
      t.boolean :visible,                default: true
      t.integer :status,    null: false, default: 0, limit: 1  # default: active
      t.string  :url,       null: false
      t.string  :seo_title, null: false
      t.text    :seo_description,        default: ''
      t.text    :seo_keywords,           default: ''

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
