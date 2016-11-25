require "rails_helper"
describe BooksController, type: :controller do
  before do
    FactoryGirl.create_list :book, 5
  end

  let(:book) { Book.first }
  let(:collection_scope) { subject.send(:collection_scope) }
  let(:current_collection) { subject.send(:current_collection) }
  let(:current_object) { subject.send(:current_object) }
  let(:valid_params) { { title: "New Title", author: "New Author" } }
  let(:invalid_params) { { title: "" } }

  describe "#resource_params" do
    it { should permit(:title, :author).for(:create, params: { book: valid_params }) }
    it { should permit(:title, :author).for(:update, params: { id: book.id, book: valid_params }) }
  end

  describe "#current_scope" do
    it { expect(collection_scope).to eq(Book) }
  end

  describe "GET index" do
    before { get :index, page: 1 }

    describe "#current_collection" do
      it { expect(current_collection).to be_a(Book::ActiveRecord_Relation) }

      it "should paginate" do
        FactoryGirl.create_list :book, 50
        expect(current_collection.count).to eq(25) # kaminari default
      end
    end

    describe "#current_object" do
      it { expect { current_object }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe "GET show" do
    describe "#current_object" do
      it do
        get :show, id: book.id
        expect(current_object).to eq(book)
      end
    end
  end

  describe "GET edit" do
    describe "#current_object" do
      it do
        get :edit, id: book.id
        expect(current_object).to eq(book)
      end
    end
  end

  describe "PUT update" do
    context "when valid" do
      before do
        put :update, id: book.id, book: valid_params
        book.reload
      end

      describe "#current_object" do
        it { expect(current_object).to eq(book) }
      end

      it "should update Book object" do
        expect(book.title).to eq("New Title")
      end

      it { expect(flash[:success]).to eq I18n.t("success.update") }
      it { expect(response).to redirect_to(action: :edit, id: book.id) }
    end

    context "when invalid" do
      before do
        put :update, id: book.id, book: invalid_params
        book.reload
      end

      it "should fail to update" do
        expect(book.title).not_to eq("")
      end

      it { expect(response).to render_template(:edit) }
    end
  end

  describe "GET new" do
    describe "#current_object" do
      it do
        get :new
        expect(current_object).to be_a collection_scope.new.class
      end
    end
  end

  describe "POST create" do
    describe "#current_object" do
      it { expect { current_object }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context "when valid" do
      it { expect { post :create, book: valid_params }.to change(Book, :count).by(1) }
      describe do
        before { post :create, book: valid_params }
        it { expect(response).to redirect_to(action: :edit, id: current_object.id) }
        it { expect(flash[:success]).to eq I18n.t("success.create") }
      end
    end

    context "when invalid" do
      it { expect { post :create, book: invalid_params }.to change(Book, :count).by(0) }
      describe do
        before { post :create, book: invalid_params }
        it { expect(response).to render_template(:new) }
      end
    end
  end

  describe "DELETE destroy" do
    context "when valid" do
      it { expect { delete :destroy, id: book.id }.to change(Book, :count).by(-1) }
      describe do
        before { delete :destroy, id: book.id }
        it { expect(response).to redirect_to(action: :index) }
        it { expect(flash[:success]).to eq I18n.t("success.destroy") }
      end
    end

    context "when invalid" do
      it { expect { delete :destroy, id: "invalid" }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
