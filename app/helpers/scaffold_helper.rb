module ScaffoldHelper
  def model_title(model_class, opts = {})
    main_title(model_class.model_name.human(count: 2).capitalize, opts)
  end

  def main_title(title, opts = {})
    html_tag = opts.delete(:html_tag) || :h1
    content_tag(html_tag, title, { class: 'titlePage' }.merge(opts))
  end

  def search_collection(search, search_condition, options = {})
    form =  search_form_for search, class: 'form-inline search-form', role: 'form', wrapper: :horizontal_form do |f|
      (get_hidden_fields options.delete(:hidden_fields) || {}) +
      (hidden_field_tag :per_page, params[:per_page]) +
      (f.search_field search_condition, class: 'form-control', placeholder: t('type_text')) +
      (button_tag name: 'commit', class: 'btn btn-default' do
        ((fa_icon 'search')).html_safe
      end)
    end
    form.html_safe
  end

  def get_hidden_fields(hidden_fields)
    hfs = ''
    hidden_fields.each do |k, v|
      hfs += hidden_field_tag k, v
    end
    hfs.html_safe
  end

  def link_to_new(model, opts = {})
    return unless can?(:create, model)
    options = {
      text:   "#{fa_icon('plus')} #{content_tag(:span, t('action.new', model: model.model_name.human))}".html_safe,
      path:   "new_#{model.model_name.singular}_path",
      remote: false,
      class:  'btn btn-primary',
      id:     "new_#{model.model_name.singular}_link"
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, options[:path_params] || {}), options)
  end

  def link_to_show(record, opts = {})
    return unless can?(:show, record)
    options = {
      text: icon_show,
      path: "#{record.class.model_name.singular}_path",
      class: 'grey-color',
      remote: true
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params] || {}), options)
  end

  def link_to_edit(record, opts = {})
    return unless can?(:edit, record)
    options = {
      id:     "#{dom_id(record)}_edit",
      text:   icon_edit,
      path:   "edit_#{record.class.model_name.singular}_path",
      remote: false,
      class:  'grey-color'
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params] || {}), options)
  end

  def link_to_destroy(record, opts = {})
    return unless can?(:destroy, record)
    options = {
      id:     "#{dom_id(record)}_destroy",
      text:   icon_destroy,
      path:   "#{record.class.model_name.singular}_path",
      remote: false,
      method: :delete,
      data:   { confirm: t('messages.are_you_sure') }
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params]||{}), options)
  end

  def link_to_recover(record, opts = {})
    return unless can?(:recover, record)
    options = {
      id:     "#{dom_id(record)}_recover",
      text:   icon_recover,
      path:   "recover_#{record.class.model_name.singular}_path",
      remote: false,
      method: :post,
      data:   {confirm: t('messages.are_you_sure')}
    }.merge(opts)
    path = options.delete(:path)
    text = options.delete(:text)

    link_to(text, public_send(path, record, options[:path_params] || {}), options)
  end

  def button_to_back(path=:back)
    link_to(t('action.back'), path, class: "btn btn-default")
  end

  def button_to_edit(record, opts = {})
    link_to_edit(record, { text: icon_edit + ' ' + t('action.edit', model: ''), class: "btn btn-primary" }.merge(opts))
  end

  def default_form_options
    {
      remote:           request.xhr?,
      html:             { class: 'form-horizontal' },
      wrapper:          :horizontal_form,
      wrapper_mappings: { check_boxes:   :horizontal_radio_and_checkboxes,
                          radio_buttons: :horizontal_radio_and_checkboxes,
                          file:          :horizontal_file_input,
                          boolean:       :horizontal_boolean }
    }
  end

  def show_simple_date(date, options = {})
    return unless date
    format = date.is_a?(DateTime) ? '%d/%m/%Y %H:%M' : '%d/%m/%Y'
    l(date, { format: format }.merge(options))
  end

  def show_attr(attr, date_opts = {})
    if attr.is_a?(TrueClass) || attr.is_a?(FalseClass)
      t("humanize.#{attr}")
    elsif attr.is_a?(Date)
      show_simple_date(attr, date_opts)
    else
      attr
    end
  end

end
