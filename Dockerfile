FROM asia.gcr.io/gcp-my-th-it-dev/dbt-base:dev-v1

COPY . /dbt

ENTRYPOINT [ "dbt" ]
