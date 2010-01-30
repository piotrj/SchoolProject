# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def generate_nav()
    semantic_menu do |root|
      root.add t("navigation.tests"), school_tests_path
      root.add t("navigation.categories"), categories_path
      root.add t("navigation.users"), users_path if current_user.admin?
    end
  end
  
  def has_flash?(severity)
    flash && !flash[severity].blank?
  end
  
  def get_flash(severity)
    flash[severity]
  end
end
