FROM --platform=linux/x86_64 amazonlinux:2.0.20220912.1

RUN yum update -y && \
    yum install -y \
      git \
      tar \
      procps \
      which \
      make \
      && \
    yum groupinstall -y \
      'Development Tools' \
      && \
    yum clean all && \
    rm -rf /var/cache/yum/*

RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

RUN echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.profile && \
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

RUN source ~/.profile && \
    brew install gcc && \
    brew install node
