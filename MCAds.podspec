Pod::Spec.new do |s|
    s.name             = "MCAds"
    s.version          = "0.0.1"
    s.summary          = "聚合百度广告、广点通以及自定义广告，开屏，信息流，特定位置，简化广告接入复杂度问题。"
    s.description      = "聚合百度广告、广点通以及自定义广告，开屏，信息流，特定位置，简化广告接入复杂度问题。"
    s.license          = 'MIT'
    s.author           = { "littleplayer" => "mailjiancheng@163.com" }
    s.homepage         = "https://github.com/poholo/MCAds"
    s.source           = { :git => "https://github.com/poholo/MCAds.git", :tag => s.version.to_s }

    s.platform     = :ios, '8.0'
    s.requires_arc = true


    s.source_files = 'SDK/Classes/Categories/*.{h,m,mm}' ,
                     'SDK/Classes/Dto/*.{h,m,mm}',
                     'SDK/Classes/Manager/*.{h,m,mm}',
                     'SDK/Classes/Utils/*.{h,m,mm}',
                     'SDK/Classes/View/*.{h,m,mm}',
                     'SDK/Classes/*.{h,m,mm}'
    s.public_header_files = 'SDK/Categories/*.h' ,
                     'SDK/Classes/Dto/*.h',
                     'SDK/Classes/Manager/*.h',
                     'SDK/Classes/Utils/*.h',
                     'SDK/Classes/View/*.h',
                     'SDK/Classes/*.h'

    s.resources = ['SDK/Resources/*.xcassets', 'SDK/Datas/*.json']
    s.dependency 'GDTAd'
    s.dependency 'MCBaiduAds'
    s.dependency 'SDWebImage'
    s.dependency 'MCPlayerKit'
    s.dependency 'HWWeakTimer'

    s.ios.frameworks = 'AdSupport', 'Security', 'StoreKit', 'CoreMotion', 'CoreLocation', 'CoreTelephony', 'SystemConfiguration', 'QuartzCore'

end
