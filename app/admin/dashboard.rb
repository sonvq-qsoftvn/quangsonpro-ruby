ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
        panel "Recent posts" do
            table_for Post.order("id asc").limit(5) do
                column :id
                column "Post title", :title do |post|
                    link_to post.title, [:admin,post]
                end
                column :category, :sortable => :category
                column :created_at
            end
            strong (link_to "Show All Posts", [:admin_posts])
        end
        panel "Recent categories" do
            table_for Category.order("id asc").limit(5) do
                column :id
                column "Category name", :name do |category|
                    link_to category.name, [:admin,category]
                end
                column :created_at
            end
            strong (link_to "Show All Categories", [:admin_categories])
        end
    end
end
