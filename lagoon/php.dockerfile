ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM amazeeio/php:8.0-fpm

# ENV APP_ENV=${LAGOON_ENVIRONMENT_TYPE}
COPY --from=cli /app /app
