Rails.application.config.generators do |g|
  g.stylesheets     = false
  g.javascripts     = false
  g.helper          = false
  g.template_engine = :slim
  g.controller_specs = false
  g.active_record migration: false
end
