require './config/environment'

if ActiveRecord::Migrator.needs_migration?
   raise 'Migrations are pending. Run 'rake db:migrate' to resolve this issue.'
end

use Rack::MethodOverride

run Application Controller
