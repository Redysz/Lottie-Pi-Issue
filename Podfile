source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '10.0'
workspace 'SampleApp.xcworkspace'
project 'SampleApp.xcodeproj'

use_frameworks!

def common_pods
    pod 'lottie-ios'
end

target 'SampleApp' do
    common_pods
end

pre_install do |installer|
    Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
end