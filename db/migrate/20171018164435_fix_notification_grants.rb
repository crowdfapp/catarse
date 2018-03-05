class FixNotificationGrants < ActiveRecord::Migration
  def change
    execute <<-SQL
      grant all ON contribution_notifications to web_user;
      grant all ON contribution_notifications to admins;
    SQL
  end
end
