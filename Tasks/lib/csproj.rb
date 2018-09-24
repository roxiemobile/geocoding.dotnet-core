module RoxieMobile
  class CSProj

    def initialize(path)
      @path = path
    end

    attr_reader :path

    def update_version(version, needle)
      return unless File.exist?(@path) && @path.end_with?('.csproj')

      data = File.read(@path)
      pattern = Regexp.new("^(\s*)(<#{needle}>).*(<\/#{needle}>).*?$")

      data.gsub!(pattern, "\\1\\2#{version}\\3")
      raise "Could not insert PACKAGE_VERSION in #{@path}" unless ($1 && $2 && $3)

      File.open(@path, 'w') { |f| f.write(data) }
    end

  end
end
