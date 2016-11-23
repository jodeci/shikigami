class BooksController < Shikigami::BaseController
  private

  def collection_scope
    Book
  end

  def resource_params
    params.require(:book).permit(:title, :author)
  end
end
