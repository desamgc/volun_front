module ProjectTypeCommons
  extend ActiveSupport::Concern

  included do

    belongs_to :project_type, required: true
    belongs_to :project, required: true
    accepts_nested_attributes_for :project
    accepts_nested_attributes_for :project_type

    validate :check_project_type
    after_initialize :set_project_type
    after_initialize :build_new_project

    def self.my_type
      model_name.singular.sub(/pt_/,'')
    end

    private

    def get_related_project_type
      ProjectType.get_project_type(self.class.my_type)
    end

    def set_project_type
      self.project_type_id ||= project.try(:project_type_id) || get_related_project_type.id
    end

    def build_new_project
      return if project_id || project
      build_project
      project.project_type_id = project_type_id
      project
    end

    def project_type_valid?
      project_type_id == get_related_project_type.id
    end

    def check_project_type
      errors.add(:project_type_id, :invalid_project_type) unless project_type_valid?
    end

  end
end