class AddAdminUsers < ActiveRecord::Migration[6.1]
  def up
    admin_user = User.create!(
      name: 'admin',
      email: 'admin@toidang.xyz',
      password: 'admin123123',
      password_confirmation: 'admin123123',
      role: User.roles[:admin]
    )

    admin_user.confirm
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
