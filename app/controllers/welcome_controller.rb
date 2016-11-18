class WelcomeController < ApplicationController
  def home
    @welcome_text = Page.try(:first).try(:content)
  end
end
