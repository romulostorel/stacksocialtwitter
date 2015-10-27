class TwitterSearcher
  DEFAULT_LIMIT = 25

  def self.search(rest_client: Twitter::RestClient, limit: DEFAULT_LIMIT, term:)
    begin
      rest_client.search(term).try(:take, limit)
    rescue
      []
    end
  end
end
