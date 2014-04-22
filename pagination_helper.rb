class PaginationHelper

  # attr_reader :collection, :items_per_page

  # The constructor takes in an array of items and a integer indicating how many
  # items fit within a single page
  def initialize(collection, items_per_page)
    @collection = collection
    @items_per_page = items_per_page
  end

  # returns the number of items within the entire collection
  def item_count
    @collection.length
  end

  # returns the number of pages
  def page_count
    (@collection.length.to_f / @items_per_page).ceil
  end

  # returns the number of items on the current page. page_index is zero based.
  # this method should return -1 for page_index values that are out of range
  def page_item_count(page_index)
    return -1 if page_index >= page_count
    # @collection[page_index*@items_per_page, @items_per_page].length
    return item_count % @items_per_page if page_count - 1 == page_index
    @items_per_page
  end

  # determines what page an item is on. Zero based indexes.
  # this method should return -1 for item_index values that are out of range
  def page_index(item_index)
    return -1 if item_index < 0 or item_index >= item_count
    item_index / @items_per_page
  end

  # private

  # def last_page?(page_index)
  #   page_count - 1 == page_index
  # end

  # def page_out_of_range?(page_index)
  #   page_index < 0 or page_index >= page_count
  # end

  # def index_out_of_range?(item_index)
  #   item_index < 0 or item_index >= item_count
  # end
end


describe PaginationHelper do

  @helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)

  describe '#page_count' do
    it 'returns the number of pages' do
      Test.assert_equals(@helper.page_count, 2)
    end
  end

  describe '#item_count' do
    it 'returns total amount of items' do
      Test.assert_equals(@helper.item_count, 6)
    end
  end

  describe '#page_item_count' do
    it 'returns the number of items on the current page' do
      Test.assert_equals(@helper.page_item_count(0), 4)
    end
    it 'knows about the last page' do
      Test.assert_equals(@helper.page_item_count(1), 2)
    end
    it 'returns -1 if page is invalid' do
      Test.assert_equals(@helper.page_item_count(2), -1)
    end
  end

  describe '#page_index' do
    it 'returns what page an item is on' do
      Test.assert_equals(@helper.page_index(5), 1)
      Test.assert_equals(@helper.page_index(4), 1)
      Test.assert_equals(@helper.page_index(2), 0)
    end
    it 'returns -1 if page index is out of range' do
      Test.assert_equals(@helper.page_index(20), -1)
    end
    it 'returns -1 if page index is negative' do
      Test.assert_equals(@helper.page_index(-10), -1)
    end
  end

end