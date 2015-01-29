
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = "/packet/:attachment/:id_partition/:style/#{rand(100**10)}.:filename"
Paperclip::Attachment.default_options[:s3_host_name] = 'dejalearn.s3.amazonaws.com'
