class GitHook < ActiveRecord::Base
  belongs_to :project
  validates :project, presence: true

  def commit_message_allowed?(message)
    if commit_message_regex.present?
      if message =~ Regexp.new(commit_message_regex)
        true
      else
        false
      end
    else
      true
    end
  end

  def commit_validation?
    commit_message_regex.present? || author_email_regex.present? || member_check
  end
end
