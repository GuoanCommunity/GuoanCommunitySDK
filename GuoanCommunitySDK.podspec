Pod::Spec.new do |s|
  s.name             = 'GuoanCommunitySDK'
  s.version          = '0.1.1'
  s.summary          = 'GuoanCommunitySDK for iOS.'

  s.homepage         = 'https://github.com/GuoanCommunity/GuoanCommunitySDK-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'octmon' => 'octmon@qq.com' }
  s.source           = { :git => 'https://github.com/GuoanCommunitySDK-iOS/GuoanCommunitySDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.ios.vendored_frameworks = 'GuoanCommunitySDK.framework'
end
