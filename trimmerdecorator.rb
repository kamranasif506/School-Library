require_relative 'basedecorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    original_name = @nameable.correct_name
    trimmed_name = original_name.length > 10 ? original_name[0..9] : original_name
    trimmed_name
  end
end