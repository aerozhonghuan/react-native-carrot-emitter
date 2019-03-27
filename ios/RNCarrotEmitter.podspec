
Pod::Spec.new do |s|
  s.name         = "RNCarrotEmitter"
  s.version      = "1.0.0"
  s.summary      = "RNCarrotEmitter"
  s.description  = <<-DESC
                  RNCarrotEmitter
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNCarrotEmitter.git", :tag => "master" }
  s.source_files  = "RNCarrotEmitter/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  