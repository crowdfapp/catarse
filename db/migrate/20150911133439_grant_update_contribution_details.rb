class GrantUpdateContributionDetails < ActiveRecord::Migration
  def up
    execute <<-SQL
    GRANT update ON "1".contribution_details TO admins;
    SQL
  end

  def down
    execute <<-SQL
    REVOKE update ON "1".contribution_details FROM admins;
    SQL
  end
end
