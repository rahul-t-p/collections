# Multiple ways to connect to WiFi network

1. With `nmcli`
```
sudo -S nmcli device wifi connect <SSID> password <password>
```
Useful commands with nmcli;
```
nmcli d
sudo nmcli d wifi list | grep <SSID>
sudo -S nmcli connection delete id <SSID>
nmcli con show --active
sudo nmcli d wifi rescan
```

2. With WPA Supplicant
    - Add WiFi network (including SSID and password) in `wpa_supplicant.conf`
    ```
    sudo vim.tiny /etc/wpa_supplicant/wpa_supplicant.conf
    ```
    - Restart the configration with proper interface.
    ```
    wpa_cli -i <interface> reconfigure
    ```

