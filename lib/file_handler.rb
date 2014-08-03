require 'json'

module FileHandler

  def self.save_to_file(data)
    old_data = JSON.parse( IO.read('./data/high_scores.json') )
    File.open('./data/high_scores.json', 'w') do |f|
      f << old_data.to_json
      f << data.to_json
    end
  end

  def self.parse_high_scores
    JSON.parse( IO.read('./data/high_scores.json') )
  end

end
