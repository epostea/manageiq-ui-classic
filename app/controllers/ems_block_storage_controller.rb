class EmsBlockStorageController < ApplicationController
  include Mixins::GenericListMixin
  include Mixins::GenericShowMixin
  include Mixins::EmsCommon
  include Mixins::GenericSessionMixin
  include Mixins::BreadcrumbsMixin
  include Mixins::StorageCommonMixin

  before_action :check_privileges
  before_action :get_session_data
  after_action :cleanup_action
  after_action :set_session_data

  def self.model
    ManageIQ::Providers::StorageManager
  end

  def self.table_name
    @table_name ||= "ems_block_storage"
  end

  def breadcrumb_name(_model)
    _('Block Storage Managers')
  end

  # Show the main MS list view
  def show_list
    opts = {:supported_features_filter => "supports_block_storage?",
            :layout                    => "ems_storage",
            :model                     => model}
    process_show_list(opts)
  end

  def download_data
    assert_privileges('ems_block_storage_show_list')
    super
  end

  def download_summary_pdf
    assert_privileges('ems_block_storage_show')
    super
  end

  def breadcrumbs_options
    {
      :breadcrumbs => [
        {:title => _("Storage")},
        {:title => _("Block Storage")},
        {:url   => controller_url, :title => _("Managers")},
      ],
    }
  end

  menu_section :bst
  feature_for_actions "#{controller_name}_show_list", *ADV_SEARCH_ACTIONS
  has_custom_buttons
end
