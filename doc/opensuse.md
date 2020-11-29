# Opensuse

## Networking

### Firewalld

Tumbleweed comes, by default, with a "None In, All Out" firewall meaning any services you attempt to connect to on the server would be blocked by the firewall.

#### Plex

```
<?xml version="1.0" encoding="utf-8"?>
<service>
    <short>Plex Media Server</short>
    <description>Firewall ports required by the Plex Media Server</description>
    <port protocol="udp" port="1900"></port>
    <port protocol="tcp" port="3005"></port>
    <port protocol="udp" port="5353"></port>
    <port protocol="tcp" port="8324"></port>
    <port protocol="tcp" port="32400"></port>
    <port protocol="udp" port="32410"></port>
    <port protocol="udp" port="32412"></port>
    <port protocol="udp" port="32413"></port>
    <port protocol="udp" port="32414"></port>
    <port protocol="tcp" port="32469"></port>
</service>
```