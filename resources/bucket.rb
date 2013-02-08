actions :create

attribute :bucket_name, :kind_of => String, :name_attribute => true
attribute :config, :kind_of => String, :default => '/root/.s3cfg'