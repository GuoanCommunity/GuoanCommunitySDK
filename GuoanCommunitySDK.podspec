Pod::Spec.new do |s|
  s.name             = 'GuoanCommunitySDK'
  s.version          = '0.3.0'
  s.summary          = 'GuoanCommunitySDK for iOS.'

  s.homepage         = 'https://github.com/GuoanCommunity/GuoanCommunitySDK-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'octmon' => 'octmon@qq.com' }
  s.source           = { :git => 'https://github.com/GuoanCommunity/GuoanCommunitySDK-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.ios.vendored_frameworks = 'GuoanCommunitySDK.framework'

  s.dependency 'ZLPhotoBrowser' # https://github.com/longitachi/ZLPhotoBrowser
  s.dependency 'AliyunOSSiOS' # https://promotion.aliyun.com/ntms/act/ossdoclist.html
  s.dependency 'GTMBase64' # https://github.com/MxABC/GTMBase64
end
