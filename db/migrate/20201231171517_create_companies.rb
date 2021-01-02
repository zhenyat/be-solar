class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string  :name,      null: false
      t.string  :title,     null: false
      t.string  :email,     null: false
      t.string  :phone,     null: false
      t.string  :address,   null: false
      t.string  :url,       null: false
      t.integer :status,    null: false, default: 0, limit: 1  # default: active
      t.string  :seo_title, null: false
      t.text    :seo_description, default: ''
      t.text    :seo_keywords,    default: ''

      t.timestamps
    end
    add_index :companies, :name,      unique: true
    add_index :companies, :email,     unique: true
    add_index :companies, :seo_title, unique: true
  end
end
