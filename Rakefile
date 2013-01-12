require 'aws/s3'
require 'active_support/time'

desc "upload resume to s3"
task :upload do
  AWS::S3::Base.establish_connection!(access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SEC'])

  bucket = "www.bsrhodes.com"
  folder = "resume"

  Dir["build/**/**"].each do |file|
    next if file.index(".").nil?

    remote = "#{folder}/#{file.gsub("build/", '')}"

    puts "#{file} ==> #{remote}"

    options = {
      'access'        => :public_read,
      'Cache-Control' => 'max-age=315576000',
      'Expires'       => 10.years.from_now.httpdate
    }

    AWS::S3::S3Object.store(remote, File.open(file), bucket, options)
  end
end
