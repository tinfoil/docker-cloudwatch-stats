FROM gliderlabs/alpine:3.3

RUN apk --update add wget perl-datetime perl-lwp-protocol-https perl-digest-sha1

ENV CLOUDWATCH_MONITORING_VERSION=1.2.1

RUN wget --quiet http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-$CLOUDWATCH_MONITORING_VERSION.zip && \
    unzip CloudWatchMonitoringScripts-$CLOUDWATCH_MONITORING_VERSION.zip && \
    rm CloudWatchMonitoringScripts-$CLOUDWATCH_MONITORING_VERSION.zip

WORKDIR /aws-scripts-mon

CMD ["./mon-put-instance-data.pl", "--mem-util", "--mem-used", "--mem-avail", "--swap-util", "--swap-used"]
