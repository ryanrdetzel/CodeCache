class Snippet < ActiveRecord::Base
  include Elasticsearch::Model
  #before_save :set_uuid

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'english', index_options: 'offsets'
      indexes :uuid, analyzer: 'english', index_options: 'offsets'
    end
  end

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
