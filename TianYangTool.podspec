Pod::Spec.new do |s|

s.name         = "TianYangTool"
s.version      = "0.0.1"
s.summary      = "for ios."
s.homepage     = "https://github.com/tianyang828/TianYangTool.git"
s.license      = "MIT"
s.author       = { "tianyang" => "tianyang6916@163.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/tianyang828/TianYangTool.git", :tag => "0.0.1" }
s.source_files = "TianYangTool", "Classes/**/*.{h,m}"
#s.source_files = "Classes/*"
s.framework    = "UIKit"
s.requires_arc = true


end
