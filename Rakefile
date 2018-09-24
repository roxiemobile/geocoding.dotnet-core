# coding: utf-8
base_dir = File.expand_path('..', __FILE__)

$:.unshift base_dir
require 'bundler'
Dir.glob(File.join(base_dir, 'Tasks', '**', '*.rb'), &method(:require))

PACKAGE ||= RoxieMobile::Package.new(
  name: 'Geocoding',
  base_dir: base_dir,
  projects_sources: [
    'Google'
  ],
  projects_tests: [
    # No projects
  ]
)

desc 'Bump all versions to match PACKAGE_VERSION.'
task :update_version => 'all:update_version'
