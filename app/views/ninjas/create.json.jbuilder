if @ninja.persisted?
  json.form render(partial: "ninjas/form", formats: :html, locals: {ninja: Ninja.new})
  json.inserted_item render(partial: "ninjas/ninja", formats: :html, locals: {ninja: @ninja})
else
  json.form render(partial: "ninjas/form", formats: :html, locals: {ninja: @ninja})
end
