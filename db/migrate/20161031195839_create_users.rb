class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :urls
      t.string :token
      t.string :refresh_token
      t.datetime :expires_at
      t.boolean :expires
      t.string :language_code, default: "en"
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
