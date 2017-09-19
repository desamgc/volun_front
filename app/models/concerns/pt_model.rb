module PtModel
  extend ActiveSupport::Concern
  included do
    has_one :project, as: :pt_extendable, required: true
    accepts_nested_attributes_for :project

    # validate :check_project_type
    # after_initialize :build_new_project
    # before_destroy :check_project_references

    private

    def project_type_valid?
      self.class.model_name.singular == project.project_type.kind
    end

    def check_project_type
      errors.add(:base, :invalid_project_type) unless project_type_valid?
    end

    def build_new_project(attributes = {})
      return if persisted? || project
      attributes.reverse_merge!(
        project_type: ProjectType.where(kind: ProjectType.kinds[self.class.model_name.singular]).take
      )
      build_project(attributes)
    end

    def check_project_references
      if project_references?
        errors.add :base, :unable_to_delete_due_to_project_references
        false
      end
    end

    def project_references?
      Project.where(pt_extendable_id: id, pt_extendable_type: self.class.name).exists?
    end
  end
end
