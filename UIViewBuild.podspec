Pod::Spec.new do |s|
  s.name             = 'UIViewBuild'
  s.version          = '0.1.1'
  s.summary          = 'Create views, lay out subviews and bind the view to a view model.'
  s.swift_version    = '5.0'

  s.description      = <<-DESC
Builder for UIViews.
Create views, lay out subviews and bind the view to a view model.
                       DESC

  s.homepage         = 'https://github.com/anconaesselmann/UIViewBuild'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'anconaesselmann' => 'axel@anconaesselmann.com' }
  s.source           = { :git => 'https://github.com/anconaesselmann/UIViewBuild.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'UIViewBuild/Classes/**/*'

  s.dependency 'Tuple'
end
