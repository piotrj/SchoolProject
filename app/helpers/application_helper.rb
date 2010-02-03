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
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
end
