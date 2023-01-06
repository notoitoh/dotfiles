echo "Install dnsmasq..."

brew install dnsmasq

symlink-replace "${SCRIPT_DIR}/resources/dnsmasq/dnsmasq.conf" "$(brew --prefix)/etc/dnsmasq.conf"
echo "$password" | sudo -S symlink-replace "${SCRIPT_DIR}/resources/resolver/localhost" "/etc/resolver/localhost"
echo "$password" | sudo -S brew services start dnsmasq

echo "Install dnsmasq completed."