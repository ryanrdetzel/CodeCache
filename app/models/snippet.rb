require 'securerandom'

class Snippet < ActiveRecord::Base
  #before_save :set_uuid

  def initialize(attributes = {})
    super
    unless self.uuid?
      logger.debug "GENERATE UUID"
      self.uuid = SecureRandom.uuid.gsub('-', '')[0..8]
    end
  end

  def to_param
    uuid
  end
 
  #def set_uuid
  #  unless self.uuid?
  #    logger.debug "Setting Uuid"
  #    #self.uuid = SecureRandom.uuid.gsub('-', '')[0..8]
  #  end
  #end
end
