require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_attached_of(:images) }
  it { is_expected.to validate_content_type_of(:images).allowing('image/png', 'image/jpeg') }
end
