class Search
  attr_reader :query
  def initialize(query, kinds)
    @query = query
    @keywords = query.split(' ').map { |word| word.strip}
    @kinds = Image::VALID_KINDS.select { |kind| kinds[kind] }
    @kinds = Image::VALID_KINDS if @kinds.empty?
  end

  def find_images
    if @keywords.empty?
      Image.all.select { |image| @kinds.include? image.kind }
    else
      Image.tagged_with(@keywords, :wild => true, :any => true)
        .select { |image| @kinds.include? image.kind }
    end
  end
end