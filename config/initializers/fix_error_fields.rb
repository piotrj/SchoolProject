ActionView::Base.field_error_proc = Proc.new {|html_tag, instance| 
%(<span class="field-with-errors">#{html_tag}</span>)}