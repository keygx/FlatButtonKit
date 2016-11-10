Pod::Spec.new do |s|
  s.name = "FlatButtonKit"
  s.version = "1.3.1"
  s.summary = "FlatButtonKit is written by Swift and make Flat Style Button from UILabel."
  s.homepage = "https://github.com/keygx/FlatButtonKit"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "keygx" => "y.kagiyama@gmail.com" }
  s.social_media_url = "http://twitter.com/keygx"
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source = { :git => "https://github.com/keygx/FlatButtonKit.git", :tag => "#{s.version}" }
  s.source_files  = "Source/*"
  s.requires_arc = true
end
