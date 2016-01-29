# Docker CloudWatch Stats #

[![Docker Repository on Quay](https://quay.io/repository/tinfoil/cloudwatch-stats/status?token=743704ca-63ae-4427-9a50-43e691785a92 "Docker Repository on Quay")](https://quay.io/repository/tinfoil/cloudwatch-stats)

Standalone container intended to be run via cron/systemd.timer that reports
current memory metrics of host EC2 instance to CloudWatch.

## Usage ##
### `docker-cloudwatch.service`
    [Unit]
    Description=someapp cloudwatch stats
    After=docker.service
    Requires=docker.service

    [Service]
    TimeoutStartSec=0
    ExecStartPre=-/usr/bin/docker kill cloudwatch-stats
    ExecStartPre=-/usr/bin/docker rm cloudwatch-stats
    ExecStartPre=-/usr/bin/docker pull quay.io/tinfoil/cloudwatch-stats
    ExecStart=/usr/bin/docker run quay.io/tinfoil/cloudwatch-stats

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
