# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

workspace 'MoviesSearch.xcworkspace'
project 'MoviesSearch.xcodeproj'

def networking_pod
  pod 'MOVSNetworking', :path => 'DevelopmentPods/MOVSNetworking', :testspecs => ['Tests']
end

def authorization_pod
  pod 'MOVSAuthorization', :path => 'DevelopmentPods/MOVSAuthorization'
end

def login_pod
  pod 'MOVSLogin', :path => 'DevelopmentPods/MOVSLogin' 
end

def movie_pod
  pod 'MOVSMovies', :path => 'DevelopmentPods/MOVSMovies'
end

def development_pods
  networking_pod
  authorization_pod
  login_pod
  movie_pod
end

target 'MoviesSearch' do
  use_frameworks!
  # Pods for App
  development_pods
end
target 'MoviesSearchTests' do
  inherit! :search_paths
end

target 'MoviesSearchUITests' do
end

target 'MOVSNetworking_Example' do
  use_frameworks!
  
  project 'DevelopmentPods/MOVSNetworking/Example/MOVSNetworking.xcodeproj'
end

target 'MOVSAuthorization_Example' do
  use_frameworks!
  
  project 'DevelopmentPods/MOVSAuthorization/Example/MOVSAuthorization.xcodeproj'
end


target 'MOVSLogin_Example' do
  use_frameworks!
  
  project 'DevelopmentPods/MOVSLogin/Example/MOVSLogin.xcodeproj'
end

target 'MOVSMovies_Example' do
  use_frameworks!
  
  project 'DevelopmentPods/MOVSMovies/Example/MOVSMovies.xcodeproj'
end
