class AddMagicLinkTokenToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :magic_link_token, :string
  end
end
