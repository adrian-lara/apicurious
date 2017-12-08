class GithubRepo

  def self.retrieve_all(user)
    GithubRepoService.retrieve_all(user).map do |repo_data|
      GithubRepo.new(repo_data)
    end
  end

  attr_reader :name

  def initialize(information)
    @name = information["name"]
  end

end
