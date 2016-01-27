# Open/Closed Principle
# Classes/methods should be OPEN FOR EXTENSION but
# CLOSED FOR MODIFICATION

class FileParser
  def initialize(parser)
    @parser = parser
  end

  def parse(file)
    parser.parse(file)
    file.save!
  end

  private
  attr_reader :parser
end

class XmlParser
  def parse(file)
  end
end

class CsvParser
  def parse(file)
  end
end

file = File.new
xml_parser = XmlParser.new
file_parser = FileParser.new(xml_parser).parse(file)
file_parser.parse # => file all parsed