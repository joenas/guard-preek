require 'preek'

module Guard
  class Preek
    class Runner
      def initialize(files, report_type)
        @files = Array(files)
        @report_type = report_type
      end

      def perform
        ::Preek::Examiner.new(@files, excludes, reporter: reporter).perform
      end

    private
      def excludes
        %w(IrresponsibleModule)
      end

      def reporter
        if @report_type == :verbose
          ::Preek::VerboseReport
        else
          ::Preek::QuietReport
        end
      end
    end
  end
end