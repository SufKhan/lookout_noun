class Search
  def initialize(query, kinds)
    @keywords = query.split(' ').map { |word| word.strip}
    @kinds = Image::VALID_KINDS.select { |kind| kinds[kind] }
    @kinds = Image::VALID_KINDS if @kinds.empty?
    find_images.each {|x| puts x.inspect}
  end

  def find_images
    Image.tagged_with(@keywords, :wild => true, :any => true)
      .select { |image| @kinds.include? image.kind }
  end
end