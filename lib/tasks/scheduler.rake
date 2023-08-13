desc "Fetch earthquake XML"
task :earthquake_fetch_xml => :environment do
  puts "Fetch earthquake XML start..."
  Earthquake.fetch_xml
  puts "done."
end

desc "Fetch news API"
task :news_fetch_api => :environment do
  puts "Fetch news API start..."
  News.fetch_api
  puts "done."
end

desc "Fetch weather API"
task :weather_fetch_api => :environment do
  puts "Fetch weather API start..."
  Weather.fetch_api
  puts "done."
end
