require 'aws-sdk-resources'

class EbookService
  # Not yet required
  # def temporary_url(path, expires_in: 3600)
  #   object = bucket.object(path)
  #   object.presigned_url(:get, expires_in: expires_in)
  # end

  def public_url(path)
    bucket.object(path).public_url
  end

  private

  def bucket
    s3_resource.bucket(Rails.application.secrets.bucket)
  end

  def s3_resource
    client = Aws::S3::Client.new(region: Rails.application.secrets.region)
    Aws::S3::Resource.new(client: client)
  end
end