class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.boolean :default
      t.string :phone_number
      t.references :contactable, polymorphic: true

      t.timestamps
    end
  end
end
