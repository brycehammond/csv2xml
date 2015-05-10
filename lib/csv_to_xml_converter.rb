class CSVToXMLConverter

  def self.export_xml_file(template, csv_file)

    if csv_file.respond_to?(:read)
      csv_contents = csv_file.read
    elsif csv_file.respond_to?(:path)
      csv_contents = File.read(csv_file.path)
    else
      logger.error "Bad file_data: #{csv_file.class.name}: #{csv_file.inspect}"
    end

    xml_entries = []

    CSV.parse(csv_contents) do |row|
      
      item_template = template.item_template.dup

      row.each_with_index do |item, index|
        item_template.gsub!("\##{index + 1}\#", item)
      end

      xml_entries << item_template

    end

    template.wrapper.gsub("\#items\#", xml_entries.join("\n"))

  end

end