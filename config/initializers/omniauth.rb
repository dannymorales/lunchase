Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "5Lgkog6rZ5qm3k68gZrikfBfo", "3Gby1pVfUsSojp2wiuqaJV8CzfpLuYTPRt7Laq82P3HOLBiu1k"
  # provider :facebook, "841331529253527", "ed2f3e49fd2f460dcad9857efb3cc362"
end