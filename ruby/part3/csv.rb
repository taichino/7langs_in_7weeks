class CsvRow
  attr_accessor :columns, :headers  
  
  def initialize(row, headers)
    @columns = row.chomp.split(',')
    @headers = headers
  end

  def method_missing(name, *args)
    idx = @headers.index(name.to_s)
    return nil if not idx
    return @columns[idx]
  end
end

module ActsAsCsv
  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :contents
    
    def read
      @contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      headers = file.gets.split(',').map{|item| item.strip }
      file.each {|row|
        @contents << CsvRow.new(row, headers)
      }
    end

    def each(&block)
      @contents.each(&block)
    end
    
    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
m.each {|row|
  puts row.one
}
