include_recipe "accounts::mizkei"
include_recipe "accounts::ken39arg"
include_recipe "accounts::dozen"

group "wheel" do
  members [
    "dozen",
    "ken39arg",
    "mizkei",
    node[:accounts][:app_user]
  ]
end
