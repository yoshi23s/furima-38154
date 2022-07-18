class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal_code,   null false, default: ""
      t.string     :prefecture_id, null false, default: ""
      t.string     :city,          null false, default: ""
      t.string     :address,       null false, default: ""
      t.string     :building,                  default: ""
      t.string     :phone_number,  null false, default: ""
      t.references :order,         null false, default: "", foreign_key: true
      t.timestamps
    end
  end
end
