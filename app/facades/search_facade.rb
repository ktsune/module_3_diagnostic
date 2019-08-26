SearchFacade
  def nearest_stations
    # => set up faraday object
    conn = Faraday.new(:url => 'https://developer.nrel.gov/api/alt-fuel-stations/v1/') do |f|
      f.headers['X-API-KEY'] = ENV['NREL_KEY']
      f.faraday.adapter  Faraday.default_adapter

    # => make api call & parse the response
    response = JSON.parse(conn.get('/nearest.json?fuel_type=ELEC,LPG&limit=10&location=Denver, CO'))

    # => make station objects, then make the station class

  end
end

# => ideally make a service to handle the api call
