class MeetupV3
  def initialize(access_token:)
    @access_token = access_token
  end

  def events(params = {})
    get('/self/events', params).map do |event|
      parsed = {
        group: OpenStruct.new(event["group"]),
        time: Time.at(event["time"] / 1000),
        venue: OpenStruct.new(event["venue"]),
      }

      OpenStruct.new(event.merge(parsed))
    end
  end

  def groups(params = {})
    get('/self/groups', params).map do |group|
      OpenStruct.new(group)
    end
  end

  private

  def get(path, params)
    response = Unirest.get build_url(path),
                           headers: { "Authorization" => "Bearer #{@access_token}" },
                           parameters: params
    response.body
  end

  def build_url(path)
    "https://api.meetup.com" + path
  end
end
