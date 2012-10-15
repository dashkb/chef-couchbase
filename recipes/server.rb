couchbase_pkg = "couchbase-server-community_x86_2.0.0-beta.deb"
couchbase_pkg_path = "/tmp/#{couchbase_pkg}"
couchbase_pkg_url = "http://packages.couchbase.com/releases/2.0.0-beta/#{couchbase_pkg}"

remote_file(couchbase_pkg_path) do
  source couchbase_pkg_url
end

dpkg_package(couchbase_pkg) do
  source "/tmp/#{couchbase_pkg}"
  action :install
end

execute "couchbase cluster init" do
  command <<-COMMAND
    /opt/couchbase/bin/couchbase-cli cluster-init -c localhost \
      --cluster-init-username=admin \
      --cluster-init-password=password \
    && touch /opt/couchbase/.chef-initialized
  COMMAND
  creates "/opt/couchbase/.chef-initialized"
  action :run
end
