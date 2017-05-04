Hanami::Model.migration do
  change do
    add_column :offers, :tags, "text[]"
  end
end
