Ahoy.geocode = true

class Ahoy::Store < Ahoy::DatabaseStore
  def track_visit(data)
    data[:country] = request.headers["<country-header>"]
    data[:region] = request.headers["<region-header>"]
    data[:city] = request.headers["<city-header>"]
    super(data)
  end
end
