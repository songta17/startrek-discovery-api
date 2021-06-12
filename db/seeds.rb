Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts ""
  puts "Processing #{file.split('/').last}..."
  require file
end
