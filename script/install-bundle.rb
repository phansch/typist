#!/usr/bin/env ruby
# Based on https://github.com/minad/moneta/blob/master/script/install-bundle

def cmd(s)
  puts s
  system(s) || abort("#{s} failed")
end

BUNDLE_FILE = "typist-bundle-#{RUBY_VERSION}.tar.gz"

if system("curl -f -u phansch:#{ENV['BUNDLE_PW']} -k -o #{BUNDLE_FILE} https://phansch.bootes.uberspace.de/bundles/#{BUNDLE_FILE}")
  cmd 'rm -rf .bundle'
  cmd "tar -xpf #{BUNDLE_FILE}"
  cmd "rm -f #{BUNDLE_FILE}"
else
  cmd 'bundle install --path .bundle'
  cmd 'bundle update'
  cmd 'bundle install --deployment --path .bundle'
  cmd "tar -cpzf #{BUNDLE_FILE} Gemfile.lock .bundle"
end
