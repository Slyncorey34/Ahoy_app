module LayoutsHelper
  # renders a given haml block inside a layout
  def inside_layout(layout)
        @view_flow.set(:layout, output_buffer)
    	output = render(:file => "layouts/#{layout}")
    	self.output_buffer = ActionView::OutputBuffer.new(output)
  end
end
