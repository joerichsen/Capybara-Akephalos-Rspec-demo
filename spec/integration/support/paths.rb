module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def front_page
    '/'
  end
end

RSpec.configuration.include NavigationHelpers, :type => :integration
