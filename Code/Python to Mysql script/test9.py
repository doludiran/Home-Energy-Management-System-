db_host = '<address reachable only by ssh_tunnel_host>'
with SSHTunnelForwarder(
    ('ssh_tunnel_host', 22),
    ssh_username="ssh_username",
    ssh_pkey="/somepath/id_rsa",
    remote_bind_address=(db_host, 3306)
) as tunnel:
    port = tunnel.local_bind_port
    db_connection = pymysql.connect(
        host='127.0.0.1', port=port, db='mysql', user='user',
        password='password', charset='utf8mb4')