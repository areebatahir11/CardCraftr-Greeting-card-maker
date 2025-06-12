class ImageEditorService
  def self.add_text(image_path:, output_path:, text:)
    image = MiniMagick::Image.open(image_path)

    image.combine_options do |c|
      c.font "Arial-Bold"            # Use a font installed on your system
      c.gravity "Center"             # Center of the image (horizontal + vertical)
      c.pointsize "36"               # Bigger font size
      c.fill "black"

      # Each line offset using \n and Y axis shift with annotate (alternative to multiple draw calls)
      multiline_text = "#{text[:name]}\n#{text[:date]}\n#{text[:message]}"
      c.draw "text 0,0 '#{multiline_text}'"
    end

    image.write output_path
  end
end
