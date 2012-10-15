maintainer       "Kyle Brett"
maintainer_email "kyle@kylebrett.com"
license          "(c) Tapjoy All rights reserved"
description      "Installs/Configures Couchbase 2.0 beta"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe           "couchbase", "Includes the client & server."
recipe           "couchbase::client", "Installs the couchbase client library"
recipe           "couchbase::server", "Installs the couchbase server" 

%w{ ubuntu debian }.each do |os|
  supports os
end
