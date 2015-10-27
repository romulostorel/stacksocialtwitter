class TwitterSearcher
  DEFAULT_LIMIT = 25

  def self.search(rest_client: Twitter::RestClient, limit: DEFAULT_LIMIT, term:)
    rest_client.search(term).try(:take, limit)
  end
end
