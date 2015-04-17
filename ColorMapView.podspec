Pod::Spec.new do |s|

  s.name         = "ColorMapView"
  s.version      = "1.0.1"
  s.summary      = "simple iOS View mapped to a color gradient."

  s.description  = <<-DESC
                   **ColorMapView** is a simple iOS View mapped to a color gradient. Great for color picker type dealies.
                   DESC

  s.homepage     = "https://github.com/Adorkable/ColorMapView"
  s.screenshots  = "https://github.com/Adorkable/ColorMapView/blob/master/Screenshots/screenshot1.png?raw=true"
  s.license      = "MIT"
  s.author             = { "Ian G" => "yo.ian.g@gmail.com" }
  s.social_media_url   = "http://twitter.com/yoiang"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Adorkable/ColorMapView.git", :tag => "1.0.1" }
  s.source_files  = "ColorMapView/**/*.{h,m}"
  s.requires_arc = true
end
