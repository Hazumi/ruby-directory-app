require 'find'
require 'fileutils'
require 'pathname'

def for_each_child_directory(root_dir)
    return if !block_given?
    old_dir = Dir.pwd
    Dir.chdir root_dir
    Dir.glob("*") do |file_path|
        if File.directory?(file_path)
            yield file_path
        end
    end
    Dir.chdir old_dir
end

for_each_child_directory("/home/impetus") do |dir|
    puts "#{dir}"
end
