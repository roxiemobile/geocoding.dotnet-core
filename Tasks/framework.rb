namespace :package do
  task :update_version do
    version = File.read(File.join(PACKAGE.base_dir, 'PACKAGE_VERSION')).strip
    PACKAGE.update_version(version)
  end
end
