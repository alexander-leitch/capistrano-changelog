Capistrano::Configuration.instance.load do
  namespace :ptlog do
    desc "Generates changelog"
    task :changes do
      put PTLog::ChangeLog.generate.to_html, "#{release_path}/public/changelog.html"
    end

    desc "Generates release file. RESTART=(true|false) option could be specified (by default is false)"
    task :release do
      put PTLog::Release.generate, "#{release_path}/version.json"
    end
  end
end
