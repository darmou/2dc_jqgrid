class JqgridGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :model_name, :type => :string, :required => true, :banner => 'ModelName'
  argument :columns, :type => :array, :default => [], :banner => 'controller_actions and model:attributes'
  
  def do_views
    template "index.html.erb", "app/views/#{plural}/index.html.erb" 
  end
  
  def do_controllers
    template "controller.rb", "app/controllers/#{plural}_controller.rb"
  end
  
  def do_routes
    route "resources #{plural_name.to_sym.inspect}"
  end 

  private 
  
  def plural
    model_name.pluralize
  end
  
  def plural_name
    model_name.underscore.pluralize
  end
        
  def camel
    model_name.camelcase
  end
  
  def klass
    @klass ||= Kernel.const_get("#{camel}")
  end
end

