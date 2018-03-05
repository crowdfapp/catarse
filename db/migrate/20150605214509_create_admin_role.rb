class CreateAdminRole < ActiveRecord::Migration
  def up
    execute <<-SQL
    DO
      $body$
    BEGIN
      IF NOT EXISTS (SELECT * FROM pg_catalog.pg_roles WHERE rolname = 'postgrest') THEN
        CREATE ROLE postgrest NOLOGIN;
      END IF;
    END
    $body$;

    DO
      $body$
    BEGIN
      IF NOT EXISTS (SELECT * FROM pg_catalog.pg_roles WHERE rolname = 'admins') THEN
        CREATE ROLE admins NOLOGIN;
      END IF;
    END
    $body$;
    -- This script assumes a role postgrest and a role anonymous already created
    GRANT usage ON SCHEMA postgrest TO admins;
    GRANT usage ON SCHEMA "1" TO admins;
    GRANT select, insert ON postgrest.auth TO admins;
    GRANT select ON ALL TABLES IN SCHEMA "1" TO admins;
    GRANT admins TO postgrest;
    SQL
  end

  def down
    execute <<-SQL
    REVOKE usage ON SCHEMA postgrest FROM admins;
    REVOKE usage ON SCHEMA "1" FROM admins;
    REVOKE select, insert ON postgrest.auth FROM admins;
    REVOKE select ON ALL TABLES IN SCHEMA "1" FROM admins;
    REVOKE admins FROM postgrest;
    DROP ROLE admins;
    SQL
  end
end
