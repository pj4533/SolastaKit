Pod::Spec.new do |s|
  s.name         = "SolastaKit"
  s.version      = "0.0.1"
  s.summary      = "Shared framework of SolastaKit dungeon parsing code"
  s.homepage     = "https://github.com/pj4533/SolastaKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = {
    "PJ Gray" => "pj4533@gmail.com"
  }
  s.source       = { :git => "git@github.com:pj4533/SolastaKit.git", :tag => s.version }
  s.swift_version = "5.0"

  s.osx.deployment_target = "10.10"

  s.source_files = "SolastaKit/**/*.{h,swift}"
  s.requires_arc = true
end