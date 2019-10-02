#
# Be sure to run `pod lib lint GFLoadingAnimationView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GFLoadingAnimationView'
  s.version          = '0.1.3'
  s.summary          = 'Simple loading view configurable'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Simple loading animation view to block UI. Easy to use and configurable.
	You can also use GFLoadingPercentualView to show a loading with percentual status.
                         DESC

  s.homepage         = 'https://github.com/guidosette/GFLoadingAnimationView'
  #s.screenshots     = 'https://github.com/guidosette/GFLoadingAnimationView/blob/master/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Guido Fanfani' => 'guido.fanfani7@gmail.com' }
  s.source           = { :git => 'https://github.com/guidosette/GFLoadingAnimationView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'GFLoadingAnimationView/Classes/**/*'
  
#   s.resource_bundles = {
#     'GFLoadingAnimationView' => ['GFLoadingAnimationView/Assets/*.png']
#   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
