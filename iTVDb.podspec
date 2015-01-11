Pod::Spec.new do |s|
  s.name         = "iTVDb"
  s.version      = "0.0.5"
  s.author       = { "Kevin Tuhumury" => "kevin.tuhumury@gmail.com" }
  s.homepage     = "https://github.com/kevintuhumury/itvdb"
  s.summary      = "iTVDb provides a wrapper around the TVDB (http://thetvdb.com) XML API and can be used in iOS and OSX apps."

  s.source       = { :git => "https://github.com/kevintuhumury/itvdb.git", :tag => "0.0.5" }
  s.source_files = '**/*.{h,m}'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.9"
  s.requires_arc = true
end
