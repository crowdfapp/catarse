class FixContributionDetailsPermissions < ActiveRecord::Migration
  def change
    execute <<-SQL
    grant select on "1".contribution_details to admins, web_user, anonymous;
    SQL
  end
end
