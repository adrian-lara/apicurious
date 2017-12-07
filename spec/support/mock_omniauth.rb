def mock_github_hash
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({"provider"=>"github",
    "uid"=>1337,
    "info"=>
      {"nickname"=>"adrian-lara"},
    "credentials"=>{"token"=>ENV["GITHUB_USER_TOKEN"], "expires"=>false}
    })
end
