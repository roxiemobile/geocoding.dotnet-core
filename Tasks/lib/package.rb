module RoxieMobile
  class Package

    def initialize(name:, base_dir:, projects_sources:, projects_tests:)
      @name = name
      @base_dir = base_dir
      @projects_sources = projects_sources
      @projects_tests = projects_tests
    end

    attr_reader :name, :base_dir, :projects_sources, :projects_tests

    def update_version(version)
      files = []

      # Project specific files
      @projects_sources.each do |project_name|
        files << CSProj.new(File.join(
          @base_dir,
          'Modules',
          "RoxieMobile.#{@name}",
          'src',
          project_name,
          "#{project_name}.csproj"
        ))
      end

      # Project specific files
      @projects_tests.each do |project_name|
        files << CSProj.new(File.join(
          @base_dir,
          'Modules',
          "RoxieMobile.#{@name}",
          'test',
          project_name,
          "#{project_name}.csproj"
        ))
      end

      # Update version in files
      files.each do |obj|
        value = case obj
        when CSProj
          'VersionPrefix'
        end
        obj.update_version(version, value)
      end
    end

  end
end
