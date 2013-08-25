require 'preek'

module Guard
  class Preek
    class Runner
      def initialize(files)
        @files = Array(files)
      end

      def perform
        ::Preek::Smell(@files, excludes)
      end

    private
      def excludes
        %w(IrresponsibleModule)
      end
    end
  end
end