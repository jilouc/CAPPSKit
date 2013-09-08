Pod::Spec.new do |s|
  s.name = 'CAPPSKit'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'Helper classes and categories to ease iOS6+ development.'
  s.homepage = 'https://github.com/jilouc/CAPPSKit'
  s.authors = { 'Jean-Luc Dagon' => 'jldagon@cocoapps.fr'}
  s.source = { :git => 'https://github.com/jilouc/CAPPSKit.git', :head }
  s.source_files = '*.{h,m}'

  s.requires_arc = true
  s.ios.deployment_target = '6.0'
  s.ios.frameworks = 'QuartzCore', 'Foundation', 'UIKit'
  
  s.subspec 'CAPPS7Kit' do |ss|
    ss.source_files = 'CAPPS7Kit'
    ss.resources = 'CAPPS7Kit/CAPPS7Kit.bundle'
  end

end
