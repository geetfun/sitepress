Mascot.configuration.parent_engine.routes.draw do
  if Mascot.configuration.routes
    constraints Mascot::RouteConstraint.new do
      get "*path", controller: "mascot/sitemap", action: "show", as: :page, format: false
    end
  end
end