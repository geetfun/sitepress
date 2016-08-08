module Mascot
  module Extensions
    # Removes the file extension from the file so that /hi/there/fun.html can be
    # resolved via /hi/there/fun.
    class RailsRequestPaths
      def process_resources(resources)
        resources.each do |r|
          r.request_path = self.class.format_path r.request_path
        end
      end

      def self.format_path(request_path)
        File.join(File.dirname(File.join("/", request_path)), File.basename(request_path, ".*"))
      end
    end
  end
end