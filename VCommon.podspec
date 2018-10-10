#
# Be sure to run `pod lib lint VCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VCommon'
  s.version          = '0.1.3'
  s.summary          = 'VCommon - Swift'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
VCommon is a shared library for using in the projects of Vektör.
                       DESC

  s.homepage         = 'https://github.com/gultekingokhan/VCommon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gultekingokhan' => 'gokhan.gultekin@vektortelekom.com' }
  s.source           = { :git => 'https://github.com/gultekingokhan/VCommon.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'
  s.source_files = 'VCommon/Classes/**/*'

  s.resource_bundles = {
      'VCommon' => ['VCommon/**/*']
  }

  # s.resources = 'VCommon/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
end
