<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<%- if attributes.find{ |attr| /\Aactive\Z/ =~ attr.name } -%>
  include Archivable
<%- end -%>

<% attributes.select(&:reference?).each do |attr| -%>
  belongs_to :<%= attr.name %><%= ', polymorphic: true' if attr.polymorphic? %>
<% end -%>

<%- if attributes.find{ |attr| /\Aname\Z/ =~ attr.name } -%>
  def to_s
    name
  end
<%- end -%>

end
<% end -%>