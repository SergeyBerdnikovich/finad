class AddCompanyDataToAdvisers < ActiveRecord::Migration
  def change
    add_column :advisers, :company_data, :text
  end
end
