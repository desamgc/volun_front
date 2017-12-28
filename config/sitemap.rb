# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.voluntariospormadrid.madrid.es"

# sitemap generator
SitemapGenerator::Sitemap.create do

  add whoami_path
  add volunteers_path
  add entities_path
  add new_user_session_path

  add projects_path, priority: 0.7, changefreq: "daily"
  Project.find_each do |project|
    add project_path(project), lastmod: project.updated_at
  end

  add activities_path, priority: 0.7, changefreq: "daily"
  Activity.find_each do |activity|
    add activity_path(activity), lastmod: activity.updated_at
  end




end
