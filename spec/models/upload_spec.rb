require 'spec_helper'

describe Upload do
  it{ should have_many :tags }
  it{ should belong_to :user }
  it{ should have_many :likes}
end
