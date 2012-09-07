#!/usr/local/bin/ruby
 
 
require 'rubygems'
require 'digest/sha1'
require 'pathname'
require 'socket'
require 'set'
require 'json'
 
def public_ip
	Socket.ip_address_list.detect{|intf| intf.ipv4? and !intf.ipv4_loopback? and !intf.ipv4_multicast? and !intf.ipv4_private?}
end

ipaddr = public_ip.ip_address


local_sum_file = "checksums.txt"
master_sum_file = "master.txt"

puts "\n+++++ Truncating the text file " + local_sum_file + " ++++++ \n\n"
File.truncate(local_sum_file, 0)


# Pass in the directory or assume the current one.
arg = ARGV[0] || "."
root_path = Pathname.new(arg).realpath.to_s
puts "Examining ++ #{root_path} ++ \n\n"
 

chksum_hash_local = Hash.new
chksum_hash_master = Hash.new
chksum_only_master = Array.new
chksum_only_local = Array.new
compare_sums = Array.new



# Recursively generate hash digests of all files.
Dir.chdir("#{root_path}")
current_file = 0
Dir['**/*.*'].each do |file|
  path = "#{root_path}/#{file}"
  # Ignore non-existent files (symbolic links) and directories.
  next if !File.exists?("#{path}") || File.directory?("#{path}")
  # Create a hash digest for the current file.
  digest = Digest::SHA1.new
  File.open(file, 'r') do |handle|
    while buffer = handle.read(4096)
      digest << buffer
    end
  end
  

  puts "#{digest} #{path} (#{current_file})"
  current_file = current_file + 1

  File.open(local_sum_file, "a") do |sum|
  sum.puts("#{digest}" "---" + "#{path}")
   end

end

#puts local_checksums.to_json

# Get the local cheksums+paths loaded into hashes for key comparison
File.open(local_sum_file, 'r') do |file|
  file.each_line do |line|
    line_data = line.split('---')
    chksum_hash_local[line_data[0]] = line_data[1]
  end
end

puts "\n\n--------------- LOCAL -------------------\n\n"

chksum_hash_local.each do |checksum, path|
puts "#{checksum} --> #{path}"
end

# Get the master cheksums and paths loaded into hashes for key comparison
File.open(master_sum_file, 'r') do |file|
  file.each_line do |line|
    line_data = line.split('---')
    chksum_hash_master[line_data[0]] = line_data[1]
  end
end

puts "\n\n-------------- MASTER ----------------\n\n"

chksum_hash_master.each do |checksum, path|
puts "#{checksum} --> #{path}"
end


chksum_only_master = File.open(master_sum_file, 'r').map { |line| line.split('---')[0] }
chksum_only_local = File.open(local_sum_file, 'r').map { |line| line.split('---')[0] }

compare_sums = chksum_only_local - chksum_only_master

if (compare_sums.length > 0) then
 puts "\n+++ Mismatching checksums found!!\n\n"
end


for sum in compare_sums
puts "#{sum}  ==> " + chksum_hash_local.fetch(sum)
end 