class RemovePostionToPortfolio < ActiveRecord::Migration[7.0]
  def change
    remove_column :portfolios, :position
  end
end
