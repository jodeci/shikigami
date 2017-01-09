# frozen_string_literal: true
require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "#no_data_alert" do
    context "when the message is specified" do
      it "should honor the specified message" do
        expect(helper.no_data_alert("TEST")).to eq '<div class="alert alert-warning">TEST</div>'
      end
    end

    context "when the message is not specified" do
      it "should fall back to the default message" do
        expect(helper.no_data_alert).to eq '<div class="alert alert-warning">尚無資料</div>'
      end
    end
  end

  describe "#bootsrap_dropdown_toggle" do
    it "should generate the correct html" do
      expect(helper.bs_dd_toggle("something")).to eq '<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">something<span class="caret"></span></a>'
    end
  end

  describe "#bootstrap_button" do
    context "when no options are specified" do
      context "when used for #show" do
        it "should default to btn-xs and btn-info" do
          expect(helper.bs_btn(:show, "#")).to eq '<a class="btn btn-xs btn-info" href="#">檢視</a>'
        end
      end

      context "when used for #edit" do
        it "should default to btn-xs and btn-warning" do
          expect(helper.bs_btn(:edit, "#")).to eq '<a class="btn btn-xs btn-warning" href="#">修改</a>'
        end
      end

      context "when used for #destroy" do
        it "should default to btn-xs and btn-danger" do
          expect(helper.bs_btn(:destroy, "#")).to eq '<a class="btn btn-xs btn-danger" href="#">刪除</a>'
        end
      end

      context "when used for actions other than #show, #edit, #destroy" do
        it "should default to btn-xs and btn-primary" do
          expect(helper.bs_btn(:new, "#")).to eq '<a class="btn btn-xs btn-primary" href="#">新增</a>'
        end
      end
    end

    context "when the style option is specified" do
      it "should honor the specified style" do
        expect(helper.bs_btn(:edit, "#", style: "danger")).to eq '<a class="btn btn-xs btn-danger" href="#">修改</a>'
      end
    end

    context "when the size option is specified" do
      it "should honor the specified size" do
        expect(helper.bs_btn(:edit, "#", size: "m")).to eq '<a class="btn btn-m btn-warning" href="#">修改</a>'
      end
    end

    context "when the method option is specified" do
      it "should generate html with the specified method" do
        expect(helper.bs_btn(:destroy, "#", method: :delete)).to eq '<a class="btn btn-xs btn-danger" rel="nofollow" data-method="delete" href="#">刪除</a>'
      end
    end

    context "when the confirm option is specified" do
      it "should generate html with the specified confirm message" do
        expect(helper.bs_btn(:destroy, "#", confirm: true)).to eq '<a class="btn btn-xs btn-danger" data-confirm="確認要刪除？" href="#">刪除</a>'
      end

      context "when there is no translation in the locale file" do
        it "should use the default confirm message" do
          expect(helper.bs_btn(:update, "#", confirm: true)).to eq '<a class="btn btn-xs btn-primary" data-confirm="Are you sure?" href="#">修改</a>'
        end
      end
    end

    context "when all options are specified" do
      it "should generate html with the specified data" do
        expect(helper.bs_btn(:update, '#', method: :post, confirm: true)).to eq '<a class="btn btn-xs btn-primary" data-confirm="Are you sure?" rel="nofollow" data-method="post" href="#">修改</a>'
      end
    end
  end
end
