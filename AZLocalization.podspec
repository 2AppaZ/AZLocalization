#
# Be sure to run `pod lib lint AZLocalization.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AZLocalization'
  s.version          = '0.1.0'
  s.summary          = 'A short description of AZLocalization.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Localizing apps can be a pain in the apps. You need to bind labels, set the locale in the apppropriate function … and this in hundreds of labels that are only displaying static placeholder text.
  This pod eases Localization of apps by adding @IBInspectable attributes to UIKit components.
  DESC

  s.homepage         = 'https://github.com/jfgrang/AZLocalization'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jfgrang' => 'jfgrang@2appaz.com' }
  s.source           = { :git => 'https://github.com/jfgrang/AZLocalization.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/2appaz'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = "10.0"

  s.source_files = 'AZLocalization/Classes/**/*'
end
