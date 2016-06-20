Pod::Spec.new do |s|
  s.name         = "Localize-Swift"
  s.version      = "0.2"
  s.summary      = "Swift-friendly localization and i18n with in-app language switching."
  s.description  = "Localize-Swift is a simple framework that improves i18n and localization in Swift iOS apps - providing cleaner syntax and in-app language switching."
  s.homepage     = "https://github.com/marmelroy/Localize-Swift"
  s.license      = "MIT"
  s.author             = { "Roy Marmelstein" => "hello@roysapps.com" }
  s.social_media_url   = "http://twitter.com/marmelroy"
  s.source       = { :git => "https://github.com/marmelroy/Localize-Swift.git", :tag => "0.2" }
  s.source_files = "Localize"
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = '2.2'
  s.requires_arc = true
end
