require "yaml"

module Sitepress
  module Parsers
    # Parses metadata from the header of the page.

    # TODO: Redo this to use File readline and pos to
    # perform faster
    class Frontmatter
      DELIMITER = "---".freeze
      NEWLINE = /\r\n?|\n/.freeze
      PATTERN = /\A(#{DELIMITER}#{NEWLINE}(.+?)#{NEWLINE}#{DELIMITER}#{NEWLINE}*)?(.+)\Z/m

      attr_reader :body

      def initialize(content)
        _, @data, @body = content.match(PATTERN).captures
      end

      def data
        @data ? YAML.load(@data) : {}
      end
    end
  end
end
