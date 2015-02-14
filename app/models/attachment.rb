class Attachment < ActiveRecord::Base
	#Associations
  belongs_to :careers_interest
  mount_uploader :file, AttachmentUploader
end