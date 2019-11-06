# c3dlab1
Simple nginx / docker config to request client certificates and log them

You must have Docker installed to use this.

# Quick Start
```
git clone https://github.com/lucaspnw/c3dlab1.git
cd c3dlab1
chmod +x run.sh
./run.sh
```

To connect to the server:

```
curl -b mycookies -L -k -v --key ~/c3dlab1/conf/ssl/myusername4.key --cert ~/c3dlab1/conf/ssl/myusername4.crt https://<target address>/
```

# Logs
To see the certificate, watch the logs
```
docker logs nginix_c3d -f
```

If the client does not send a certificate, the log will look like this:
```
10.11.10.31 - SSLC-DN:- - SSLC-Serial: - - RUSER:- [06/Nov/2019:21:40:36 +0000] "GET / HTTP/1.0" 200 33 "-" "curl/7.58.0" "-"RAW: -
```

With a certificate, the log will look like this:
```
10.11.10.31 - SSLC-DN:CN=myusername4,O=Example Corp,ST=WA,C=US - SSLC-Serial: 05 - RUSER:- [06/Nov/2019:21:41:52 +0000] "GET / HTTP/1.0" 200 33 "-" "curl/7.58.0" "-"RAW: -----BEGIN%20CERTIFICATE-----%0AMIIDXTCCAkWgAwIBAgIBBTANBgkqhkiG9w0BAQ0FADBcMRUwEwYDVQQKDAxFeGFt%0AcGxlIENvcnAxEDAOBgNVBAcMB1NlYXR0bGUxCzAJBgNVBAgMAldBMQswCQYDVQQG%0AEwJVUzEXMBUGA1UEAwwOY2EuZXhhbXBsZS5jb20wHhcNMTkxMTA0MTcyNzExWhcN%0AMTkxMTE2MjE0MTE3WjBHMQswCQYDVQQGEwJVUzELMAkGA1UECAwCV0ExFTATBgNV%0ABAoMDEV4YW1wbGUgQ29ycDEUMBIGA1UEAwwLbXl1c2VybmFtZTQwggEiMA0GCSqG%0ASIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxXvwEF3glE5at7P8s3%2FQgXhPPMimk%2FHSK%0ACjx5tVeyKSOr1F4ewP363WGp68ZnTrJwoYDt%2FW6KcGRs0eNpVwmlPzNQNb1PeWtS%0AQp%2B31USzeWpac6cyiD6MLnNnpY4qoUsfzItWiEWPjQLcASYacNbnc%2BVHA2lvLwyX%0ABoJRdwSpgp6icSe%2F2WWrNKk3%2B08GXeHSWKcxDQr5yJeZolz%2F5TuytME08J2InsnO%0AUFHwlwov%2F3iqEcJatwM0%2FVcwSCgEQuk1zwo8KXYw4fivnzwoByjW6aqkFC1zr%2FAc%0AuLGfedr8LskKVR5gLA4pBoeLO1xqhvq0R11hoj22JSjpp%2FJ6DEm7AgMBAAGjPzA9%0AMAwGA1UdEwEB%2FwQCMAAwCwYDVR0PBAQDAgTwMCAGA1UdJQEB%2FwQWMBQGCCsGAQUF%0ABwMBBggrBgEFBQcDAjANBgkqhkiG9w0BAQ0FAAOCAQEAtZSzMgaczhRIIjrW3%2BQf%0Acef3TfAJ469SpXREYp8pUGcG1QIQuZNSRCXtnPYY4OXpw381sOfg%2FLqZNovLLhw3%0AsU3c9mQT0c7E0Qj6eZioFldor5DH2ViJdqdcGQtD6GGqStpv%2BMbPS1T%2B1K82hWhm%0Af8r7j38aUmJbK%2BZifRfZjEb2YnZT1jAMPiORxazFwTeAJZYChTFy9RTKqtSiawkx%0AWzYs4%2Fx%2BWO8G0TZcOD1N8S4cgWq8oSbg2qVTTUArFSbJJWMtDSmrkZ7oqqlXcO4%2B%0AlCydDfbDPss74EE61hFOpP82YlA7YgnhAtQwPLtZgYeDrryXpsVytWqA7zKy8JZ%2F%0AWg%3D%3D%0A-----END%20CERTIFICATE-----%0A
```
