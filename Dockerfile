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

RUN echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /root/.profile && \
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile && \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

RUN source /root/.profile

RUN brew install gcc

# ==> Installation successful!
#
# ==> Homebrew has enabled anonymous aggregate formulae and cask analytics.
# Read the analytics documentation (and how to opt-out) here:
#   https://docs.brew.sh/Analytics
# No analytics data has been sent yet (nor will any be during this install run).
#
# ==> Homebrew is run entirely by unpaid volunteers. Please consider donating:
#   https://github.com/Homebrew/brew#donations
#
# ==> Next steps:
# - Run these three commands in your terminal to add Homebrew to your PATH:
#     echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /root/.profile
#     echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile
#     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# - Install Homebrew's dependencies if you have sudo access:
#     sudo yum groupinstall 'Development Tools'
#   For more information, see:
#     https://docs.brew.sh/Homebrew-on-Linux
# - We recommend that you install GCC:
#     brew install gcc
# - Run brew help to get started
# - Further documentation:
#     https://docs.brew.sh
