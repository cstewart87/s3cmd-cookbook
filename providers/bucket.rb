action :create do
  bucket_name = new_resource.bucket_name
  config = new_resource.config ? "-c #{new_resource.config}" : ''

  execute "Creating #{bucket_name} in s3" do
    command "s3cmd #{config} mb #{file_name} s3://#{bucket_name}"
  end
end