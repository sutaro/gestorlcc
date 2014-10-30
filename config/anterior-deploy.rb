require 'mongrel_cluster/recipes'

set :application, "gestorlcc"
set :repository,  "http://gestorlab.lcc.uma.es/gestorlcc/trunk"
set :deploy_to, "/var/www/html/gestorlcc"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

# set :scm, :subversion
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "150.214.108.29"                          # Your HTTP server, Apache/etc
role :app, "150.214.108.29"                          # This may be the same as your `Web` server
role :db,  "150.214.108.29", :primary => true        # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
default_run_options[:pty] = true

 set :svn_user, "root"
 set :svn_password, "reservas"
#set :user, "root"            # defaults to the currently logged in user
# set :scm, :subversion         # defaults to :subversion
# set :svn, "/usr/bin/svn"      # defaults to searching the PATH
