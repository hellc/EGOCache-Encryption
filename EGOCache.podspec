Pod::Spec.new do |s|
  s.name         = "EGOCache+Encryption"
  s.version      = "2.3.0"
  s.summary      = "Fast Caching for Objective-C (Works with macOS, iOS, tvOS and watchOS)."
  s.description  = "EGOCache-Encryption is a simple, thread-safe key value cache secure store for macOS, iOS, tvOS and watchOS."
  s.homepage     = "https://github.com/hellc/EGOCache-Encryption"
  s.license      = "MIT"
  s.author       = "hellc"
  s.social_media_url = "http://twitter.com/ihellc"
  s.source       = { :git => "https://github.com/hellc/EGOCache-Encryption.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "Sources/*.{h,m}"
  s.osx.deployment_target  = "10.8"
  s.ios.deployment_target  = "8.0"
  s.tvos.deployment_target = "9.0"
  s.watchos.deployment_target = "2.2"
end
