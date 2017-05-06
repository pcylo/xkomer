Hanami::Model.migration do
  change do
    add_column :offers, :left_count, Integer
  end
end
