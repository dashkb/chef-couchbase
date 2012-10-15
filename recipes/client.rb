couchbase_pkg = "libcouchbase2_2.0.0beta-236_i386.deb"
couchbase_pkg_path = "/tmp/#{couchbase_pkg}"
couchbase_pkg_url = "http://packages.couchbase.com/preview/ubuntu/pool/lucid/main/libc/libcouchbase/#{couchbase_pkg}"

remote_file(couchbase_pkg_path) do
  source couchbase_pkg_url
end

dpkg_package(couchbase_pkg) do
  source "/tmp/#{couchbase_pkg}"
  action :install
end
