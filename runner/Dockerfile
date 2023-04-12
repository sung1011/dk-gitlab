FROM gitlab/gitlab-runner:v14.0.1

# RUN groupadd -r gitlab-runner && useradd -r -g gitlab-runner gitlab-runner

ENV NODE_PACKAGE node-v18.13.0-linux-x64
ENV RUNNER_USER gitlab-runner

USER ${RUNNER_USER}

WORKDIR /home/${RUNNER_USER}/

# nodejs
# todo 改成arch架构 而非x86
RUN wget -O ${NODE_PACKAGE}.tar.gz https://registry.npmmirror.com/-/binary/node/latest-v18.x/${NODE_PACKAGE}.tar.gz
RUN tar -zxvf ${NODE_PACKAGE}.tar.gz 
RUN rm -f ${NODE_PACKAGE}.tar.gz

# PATH
RUN PATH=${NODE_PACKAGE}/bin:PATH
RUN export PATH