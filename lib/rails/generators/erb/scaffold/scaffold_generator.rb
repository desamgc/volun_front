require 'rails/generators/erb'
require 'rails/generators/resource_helpers'
module Erb
  module Generators
    class ScaffoldGenerator < Base
      include Rails::Generators::ResourceHelpers

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views", controller_file_path)
      end

      def copy_view_files
        available_views.each do |view|
          templatename = filename_with_extensions(view)
          filename = view == "_record" ? filename_with_extensions("_#{singular_table_name}") : templatename
          template templatename, File.join("app/views", controller_file_path, filename)
        end
      end

      protected

        def available_views
          %w(index edit show new _form _record)
        end
    end
  end
end