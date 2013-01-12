activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'img'

page "/error.html", layout: "error"

activate :relative_assets

configure :build do
  ignore "stylesheets/app/*"
  activate :minify_css
end

activate :sync do |sync|
  sync.fog_provider          = 'AWS'
  sync.fog_directory         = 'www.bsrhodes.com/resume/'
  sync.aws_access_key_id     = ENV.fetch("S3_KEY")
  sync.aws_secret_access_key = ENV.fetch("S3_SEC")
  sync.existing_remote_files = 'keep'
end

