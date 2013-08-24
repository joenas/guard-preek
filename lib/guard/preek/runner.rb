require 'preek/smell_collector'
require 'preek/smell_reporter'

module Guard
  class Preek
    class Runner
      def initialize(files)
        @files = Array(files)
      end

      def perform
        smelly_files = ::Preek::SmellCollector.new(@files, excludes).smelly_files
        ::Preek::SmellReporter.new(smelly_files).print_smells
      end

    private
      def excludes
        %w(IrresponsibleModule)
      end
    end
  end
end