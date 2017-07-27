module ApplicationHelper
  def home_page?
    return false if user_signed_in?
    # Using path because fullpath yields false negatives since it contains
    # parameters too
    request.path == '/'
  end

  # if current path is /debates current_path_with_query_params(foo: 'bar') returns /debates?foo=bar
  # notice: if query_params have a param which also exist in current path, it "overrides" (query_params is merged last)
  def current_path_with_query_params(query_parameters)
    url_for(request.query_parameters.merge(query_parameters))
  end

  def markdown(text)
    # See https://github.com/vmg/redcarpet for options
    render_options = {
      filter_html:     false,
      hard_wrap:       true,
      link_attributes: { target: '_blank' }
    }
    renderer = Redcarpet::Render::HTML.new(render_options)
    extensions = {
      autolink:           true,
      fenced_code_blocks: true,
      lax_spacing:        true,
      no_intra_emphasis:  true,
      strikethrough:      true,
      superscript:        true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end

  def districts_select_options
    District.all.order(name: :asc).collect { |g| [g.name, g.id] }
  end

  def request_reasons_select_options
    ReqReason.all.order(id: :asc).collect { |g| [g.description, g.id] }
  end

  def road_types_select_options
    RoadType.all.order(name: :asc).collect { |g| [g.name, g.name] }
  end

  def entity_types_select_options
    EntityType.all.order(description: :asc).collect { |g| [g.description, g.id] }
  end

  def number_types_select_options
    { 'Km' => :Km, 'Num' => :Num }
  end

  def provinces_select_options
    Province.all.order(name: :asc).collect { |g| [g.name, g.name] }
  end

  def projects_select_options
    Project.all.order(name: :asc).collect { |g| [g.name, g.id] }
  end

  def entity_projects_select_options(id)
    Project.unscoped.entity_projects(id).order(name: :asc).collect { |g| [g.name, g.id] }
  end

  def volunteer_projects_select_options(id)
    Project.unscoped.includes(:volunteers).where("volunteer_id = ?", id).references(:volunteers).order(name: :asc).collect { |g| [g.name, g.id] }
  end

  def entity_activities_select_options(id)
    Activity.unscoped.where("entity_id = ?", id).order(name: :asc).collect { |g| [g.name, g.id] }
  end



end
