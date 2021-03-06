require 'spec_helper'

describe Task do
  it 'should not valid on content is null' do
    task = Task.new(:user => mock_model(User),
                    :content => "")
    task.should_not be_valid
    task.should have(1).error_on(:content)
  end

end