require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe <%= class_name %>, <%= type_metatag(:model) %> do
  let(:<%= file_name %>) { build(:<%= file_name %>) }

  it 'is valid2' do
    expect(<%= file_name %>).to be_valid
  end
end
<% end -%>
