Pod::Spec.new do |s|
  s.name             = 'GuoanCommunitySDK'
  s.version          = '0.9.3'
  s.summary          = 'GuoanCommunitySDK for iOS.'

  s.homepage         = 'https://github.com/GuoanCommunity/GuoanCommunitySDK-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'octmon' => 'octmon@qq.com' }
  s.source           = { :git => 'https://github.com/GuoanCommunity/GuoanCommunitySDK-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.ios.vendored_frameworks = 'GuoanCommunitySDK.framework'

  s.dependency 'ZLPhotoBrowser', '~> 2.6.7' # https://github.com/longitachi/ZLPhotoBrowser
  s.dependency 'AliyunOSSiOS', '~> 2.10.2' # https://promotion.aliyun.com/ntms/act/ossdoclist.html
  s.dependency 'GTMBase64', '~> 1.0.1' # https://github.com/MxABC/GTMBase64
end
