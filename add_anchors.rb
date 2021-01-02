#!/usr/bin/env ruby
# Add Markdown anchors to Heading elements (only levels 1 and 2)
# The "Heading Alternate Syntax" must have at least four '=' or '-' characters otherwise the anchor is not added
# frozen_string_literal: true

require 'tempfile'
require 'fileutils'

# rubocop:disable Metrics/MethodLength
def read_header(source_file, dest_file)
  line = source_file.gets

  return line unless line && line.chomp == '---'

  found_header_start = false
  loop do
    line.chomp!
    dest_file.puts line
    if line == '---'
      return if found_header_start

      found_header_start = true
    end
    break unless (line = source_file.gets)
  end
end
# rubocop:enable Metrics/MethodLength

def contain_link?(str)
  str =~ /\[.*?\]\(.*?\)/
end

def to_anchor(str)
  return str if contain_link?(str)

  anchor = str.downcase
              .gsub(/[^a-z0-9]+/, '_')
              .gsub(/_+$/, '')

  "[#{str}](##{anchor})"
end

def flush_buffer(buffer, dest_file)
  buffer.each { |l| dest_file.puts l }
  buffer.clear
end

def heading_hash_syntax(line, buffer, dest_file)
  return false unless /^(====+)|(----+)/.match?(line)

  last_line = buffer.pop
  flush_buffer(buffer, dest_file)
  dest_file.puts to_anchor(last_line)
  dest_file.puts line
  true
end

def heading_alternate_syntax(line, buffer, dest_file)
  return false unless (m = line.match(/(^##?[^#])(.*)/))

  flush_buffer(buffer, dest_file)
  dest_file.puts "#{m[1]}#{to_anchor(m[2])}"
  true
end

def markdown_headings(line, buffer, dest_file)
  heading_hash_syntax(line, buffer, dest_file) || heading_alternate_syntax(line, buffer, dest_file)
end

def process_file(source_file, dest_file)
  buffer = []

  line = read_header(source_file, dest_file)
  # check the first line after the header is a markdown heading
  markdown_headings(line.chomp, buffer, dest_file) if line

  while (line = source_file.gets)
    line.chomp!

    buffer << line unless markdown_headings(line, buffer, dest_file)
  end

  flush_buffer(buffer, dest_file)
end

if ARGV.empty?
  puts 'Specify file'
  exit 1
end

file = File.open(ARGV[0], 'r')
temp_file = Tempfile.new('anchors')

process_file(file, temp_file)

file.close
temp_file.close

FileUtils.cp(temp_file.path, ARGV[0])
temp_file.unlink
