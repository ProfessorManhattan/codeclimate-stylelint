FROM node:alpine

WORKDIR /work

COPY local/config /usr/local/src/codeclimate-config
COPY local/codeclimate-stylelint /usr/local/bin/codeclimate-stylelint

RUN adduser --uid 9000 --gecos "" --disabled-password app \
    && npm install -g stylelint

USER app

VOLUME /code
WORKDIR /code

CMD ["codeclimate-stylelint"]

ARG BUILD_DATE
ARG REVISION
ARG VERSION

LABEL maintainer="Megabyte Labs <help@megabyte.space>"
LABEL org.opencontainers.image.authors="Brian Zalewski <brian@megabyte.space>"
LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.description="A slim Stylelint standalone linter and a CodeClimate engine for GitLab CI"
LABEL org.opencontainers.image.documentation="https://github.com/megabyte-labs/codeclimate-stylelint/blob/master/README.md"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.revision=$REVISION
LABEL org.opencontainers.image.source="https://github.com/megabyte-labs/codeclimate-stylelint.git"
LABEL org.opencontainers.image.url="https://megabyte.space"
LABEL org.opencontainers.image.vendor="Megabyte Labs"
LABEL org.opencontainers.image.version=$VERSION
LABEL space.megabyte.type="codeclimate"

FROM codeclimate AS stylelint

WORKDIR /work

USER root

RUN rm /engine.json /usr/local/bin/codeclimate-stylelint /usr/local/src/codeclimate-config

ENTRYPOINT ["stylelint"]
CMD ["--version"]

LABEL space.megabyte.type="linter"
