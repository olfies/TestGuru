module ApplicationHelper

  def this_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to("TestGuru", "https://github.com/#{author}/#{repo}", target: "_blank")
  end

end
