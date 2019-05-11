FROM alpine:3.9 as source
ENV NewRelicVersion=8.15.455.0
ENV NewRelicUrl=https://download.newrelic.com/dot_net_agent/previous_releases/${NewRelicVersion}/newrelic-netcore20-agent_${NewRelicVersion}_amd64.tar.gz
ARG NewRelicHome=/usr/local/newrelic-netcore20-agent
WORKDIR /newrelic
RUN wget "${NewRelicUrl}" -O newrelic.tar.gz && gzip -dc newrelic.tar.gz | tar -xf -

FROM microsoft/dotnet:2.2-aspnetcore-runtime-alpine3.8
ENV ASPNETCORE_ENVIRONMENT=Production
ENV CORECLR_ENABLE_PROFILING=1 \
CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
CORECLR_NEWRELIC_HOME=/usr/local/newrelic-netcore20-agent \
CORECLR_PROFILER_PATH=/usr/local/newrelic-netcore20-agent/libNewRelicProfiler.so \
NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true
RUN apk update && apk add libc6-compat && mkdir -p /usr/local/newrelic-netcore20-agent
COPY --from=source /newrelic/ /usr/local/