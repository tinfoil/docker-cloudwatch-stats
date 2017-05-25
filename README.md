# Docker CloudWatch Stats #

[![Docker Repository on Quay](https://quay.io/repository/tinfoil/cloudwatch-stats/status?token=743704ca-63ae-4427-9a50-43e691785a92 "Docker Repository on Quay")](https://quay.io/repository/tinfoil/cloudwatch-stats)

Standalone container intended to be run via cron/systemd.timer that reports
current memory metrics of host EC2 instance to CloudWatch.

## Usage ##
### `docker-cloudwatch.service`
    [Unit]
    Description=Run cloudwatch-stats
    After=docker.service
    Requires=docker.service

    [Service]
    Type=oneshot
    KillMode=none
    Restart=no
    ExecStartPre=-/usr/bin/docker stop cloudwatch-stats
    ExecStartPre=-/usr/bin/docker rm cloudwatch-stats
    ExecStart=/usr/bin/docker run \
    --rm \
    --name cloudwatch-stats \
    quay.io/tinfoil/cloudwatch-stats

### `docker-cloudwatch.timer`
    [Unit]
    Description=Run CloudWatch monitor every minute

    [Timer]
    OnCalendar=*:0/1
    Persistent=true

    [Install]
    WantedBy=timers.target

## Credits & Inspiration
* https://github.com/pebble/docker-cloudwatch-stats
* https://github.com/athieriot/docker-cloudwatch-monitor
