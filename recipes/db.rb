#cookbook:db.rb

yum_package %w(postgresql postgresql-client libpq-dev postgresql-contrib -y) do
  action :install
end

