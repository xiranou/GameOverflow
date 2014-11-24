class Topic < ActiveRecord::Base
  belongs_to :discussable, polymorphic: true
  belongs_to :article
end