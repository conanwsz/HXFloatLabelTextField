Pod::Spec.new do |s|

  s.name         = "HXFloatLabelTextField"
  s.version      = "0.0.1"
  s.summary      = "Easy way to build UITextField with icon and float label."

  s.description  = <<-DESC
                   Easy way to build UITextField with icon and float label.
                   DESC

  s.homepage     = "https://github.com/conanwsz/HXFloatLabelTextField"
  s.license      = "MIT"

  s.author       = { "conanwsz" => "conanwsz@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git  => "https://github.com/conanwsz/HXFloatLabelTextField" }
  s.source_files  = "HXFloatLabelTextField/HXFloatLabelTextField/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"
  # s.resources = ["HXIntro/Classes/*.xib","HXIntro/Images.xcassets"]

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
