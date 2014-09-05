# Uncomment this line to define a global platform for your project
# platform :ios, "6.0"

target "ColorMapViewTests" do
    pod 'Specta', '~> 0.2.x'
    pod 'Expecta', '~> 0.3.x'
    pod 'FBSnapshotTestCase', '~> 1.1'
    pod 'Expecta+Snapshots', '~> 1.2.x'
end

post_install do |installer|
    installer.project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['FRAMEWORK_SEARCH_PATHS'] = [ '$(PLATFORM_DIR)/Developer/Library/Frameworks' ]
        end
    end
end