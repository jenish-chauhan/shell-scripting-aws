# Load required Ruby gems
require 'aws-sdk-s3'      # AWS SDK for interacting with Amazon S3
require 'pry'             # Pry is an interactive REPL debugger (optional)
require 'securerandom'    # Provides SecureRandom.uuid for unique identifiers

# Get the S3 bucket name from an environment variable
# Example (in PowerShell):
# $env:BUCKET_NAME = "my-cool-bucket"; bundle exec ruby s3.rb
bucket_name = ENV['BUCKET_NAME']

# Print the bucket name to verify it’s being read correctly
puts bucket_name

# Define the AWS region for the bucket
region = 'us-west-1'

# Initialize an S3 client
# This automatically uses your AWS credentials (from environment variables or AWS config)
client = Aws::S3::Client.new(region: region)

# Create a new S3 bucket with the specified name and region
resp = client.create_bucket({
  bucket: bucket_name,
  create_bucket_configuration: {
    location_constraint: region,
  },
})

# Randomly choose how many files (between 1 and 5) to upload
number_of_files = 1 + rand(5)
puts "Uploading #{number_of_files} files to #{bucket_name}"

# Loop to create and upload files
number_of_files.times do |i|
  puts "i: #{i}"

  # Create a simple text file with random content
  filename = "file_#{i}.txt"
  output_path = "./tmp/#{filename}"

  # Ensure the tmp directory exists
  Dir.mkdir('tmp') unless Dir.exist?('tmp')

  # Write a unique UUID string to the file
  File.open(output_path, 'w') do |f|
    f.write SecureRandom.uuid
  end

  # Upload the file to S3
  File.open(output_path, 'r') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f,
    )
  end

  puts "Uploaded #{filename}"
end

puts "✅ All files uploaded successfully to #{bucket_name}"
