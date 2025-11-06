# frozen_string_literal: true

require "test_helper"
module FeedbackbinElements
  module Docs
    class ComponentsControllerTest < ActionDispatch::IntegrationTest
      test "should get index" do
        get "/feedbackbin_elements/"

        assert_response :success
      end

      test "should get accordion component" do
        get "/feedbackbin_elements/accordion"

        assert_response :success
      end

      test "should get alert component" do
        get "/feedbackbin_elements/alert"

        assert_response :success
      end

      test "should get avatar component" do
        get "/feedbackbin_elements/avatar"

        assert_response :success
      end

      test "should get badge component" do
        get "/feedbackbin_elements/badge"

        assert_response :success
      end

      test "should get breadcrumb component" do
        get "/feedbackbin_elements/breadcrumb"

        assert_response :success
      end

      test "should get button component" do
        get "/feedbackbin_elements/button"

        assert_response :success
      end

      test "should get card component" do
        get "/feedbackbin_elements/card"

        assert_response :success
      end

      test "should get dropdown_menu component" do
        get "/feedbackbin_elements/dropdown_menu"

        assert_response :success
      end

      test "should get forms component" do
        get "/feedbackbin_elements/forms"

        assert_response :success
      end

      test "should get popover component" do
        get "/feedbackbin_elements/popover"

        assert_response :success
      end

      test "should get tabs component" do
        get "/feedbackbin_elements/tabs"

        assert_response :success
      end

      test "should get toast component" do
        get "/feedbackbin_elements/toast"

        assert_response :success
      end
    end
  end
end
