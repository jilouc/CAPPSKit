Pod::Spec.new do |s|
  s.name = 'CAPPSKit'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'Helper classes and categories to ease iOS6+ development.'
  s.homepage = 'https://github.com/jilouc/CAPPSKit'
  s.authors = { 'Jean-Luc Dagon' => 'jldagon@cocoapps.fr'}
  s.source = { :git => 'https://github.com/jilouc/CAPPSKit.git', :tag => "1.0"}
  s.source_files = 'CAPPSKit/*.{m,h}', 'CAPPSKit/Categories'
  
  s.requires_arc = true
  s.ios.deployment_target = '6.0'
  s.ios.frameworks = 'QuartzCore', 'Foundation', 'UIKit'
  
  s.subspec 'CAPPS7Kit' do |ss|
    ss.source_files = 'CAPPSKit/CAPPS7Kit'
    ss.resources = 'CAPPSKit/CAPPS7Kit/CAPPS7Kit.bundle'
  end

end
