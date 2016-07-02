class PagesController < ApplicationController
  def about
    render template: "pages/about"
  end

  def why_vote
    render template: "pages/why_vote"
  end
end