# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def generate_nav()
    semantic_menu do |root|
      root.add "Tests", school_tests_path
      root.add "Categories", categories_path
      root.add "Users", users_path if current_user.admin?
    end
  end
end
