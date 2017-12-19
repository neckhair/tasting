namespace :deploy do
  desc "Restart the server"
  task :restart do
    on roles(:app) do
      within release_path do
        info '[restart] Run `rails restart`'
        execute :rails, "restart"
      end
    end
  end
  after :finishing, :restart
end
