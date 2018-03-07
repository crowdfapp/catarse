class AddedMissingGrantsToPosts < ActiveRecord::Migration
  def up
    execute %Q{
grant select on sendgrid_events to admins, web_user;
grant select on project_post_notifications to admins, web_user;
grant select on project_posts to admins, web_user;
}
  end

  def down
    execute %Q{
revoke select on sendgrid_events from admins, web_user;
revoke select on project_post_notifications from admins, web_user;
revoke select on project_posts from admins, web_user;
}
  end
end
