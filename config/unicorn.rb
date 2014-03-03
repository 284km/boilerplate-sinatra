# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
@dir = "~/myapp/"

worker_processes 2
working_directory @dir

timeout 30

# listen 80
# AWSを使っているなら、セキュリティグループで指定したportを空けておく（よく忘れてハマる）

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64

# Set process id path
pid "#{@dir}tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
# stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
# stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

# ダウンタイムなくす
preload_app true

# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
#
#   old_pid = "#{ server.config[:pid] }.oldbin"
#   unless old_pid == server.pid
#     begin
#       # SIGTTOU だと worker_processes が多いときおかしい気がする
#       Process.kill :QUIT, File.read(old_pid).to_i
#     rescue Errno::ENOENT, Errno::ESRCH
#     end
#   end
# end

# after_fork do |server, worker|
#   defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
# end

# unicorn -c config/unicorn.rb -E production -D
# unicorn_rails -c config/unicorn.rb -E production -D

# -D means daemon
# bundle exec unicorn -c config/unicorn.rb -E production -D

# $ ps auxf | grep unicorn | grep -v grep
# unicorn master -c unicorn.rb  -D
#  \_ unicorn worker[0] -c unicorn.rb -D
#  \_ unicorn worker[1] -c unicorn.rb -D

# psを見ると、workerプロセスとそれを管理するmasterプロセスが動いていることが確認できる


