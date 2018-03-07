class FixPermissions < ActiveRecord::Migration
  def change
    execute <<-SQL
grant SELECT on contribution_notifications to web_user, admins;
    SQL

  end
end
