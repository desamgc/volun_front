<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController

  respond_to :html, :js, :json

  def index
    params[:q] ||= <%= singular_table_name.camelize %>.ransack_default
    @search_q = @<%= plural_table_name %>.search(params[:q])
    @<%= plural_table_name %> = @search_q.result.paginate(page: params[:page], per_page: params[:per_page]||15)

    respond_with(@<%= plural_table_name %>)
  end

  def show
    respond_with(@<%= singular_table_name %>) do |format|
      format.js { render 'shared/popup' }
    end
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>(<%= singular_table_name %>_params)
    if @<%= singular_table_name %>.save
      redirect_to projects_url, notice: t('<%= singular_table_name %>.response')
    else
      respond_with(@<%= singular_table_name %>)
    end
  end

  def update
    @<%= singular_table_name %>.update_attributes(<%= singular_table_name %>_params)
    respond_with(@<%= singular_table_name %>)
  end

  def destroy
    @<%= singular_table_name %>.destroy
    respond_with(@<%= singular_table_name %>)
  end

  protected

    def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
    <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
    end
end
<% end -%>