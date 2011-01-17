module Rails
  module Rack
    class LogTailer
      def tail!
        @file.seek @cursor

        if !@file.eof?
          contents = @file.read
          @cursor  = @file.tell
          $stdout.print contents rescue nil
        end
      end
    end
  end
end
