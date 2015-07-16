module ApplicationHelper

  def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

  def up_vote_link_classes(post)
    vote = current.user.voted(post)
    if vote && vote.up_vote?
      "voted"
    end
  end


  def down_vote_classes(post)
    vote = current_user.voted(post)
    if vote && vote.down_vote?
      "voted"
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
