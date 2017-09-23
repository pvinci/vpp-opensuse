FROM opensuse:42.2
MAINTAINER Ed Kern <ejk@cisco.com>
LABEL Description="VPP opensuse baseline"
LABEL Vendor="cisco.com"
LABEL Version="1.0"


# Setup the environment
ENV DEBIAN_FRONTEND=noninteractive

RUN zypper --non-interactive update && \
    zypper --non-interactive install  \
        bash \
        bash-completion \
        bc \
        biosdevname \
        ca-certificates \
        cloud-init \
        cron \
        curl \
        dstat \
        file \
        fio \
        htop \
        iotop \
        iperf \
        iptables \
        less \
        lsb-release \
        lsof \
        make \
        mdadm \
        mosh \
        mtr \
        multipath-tools \
        nano \
        net-tools \
        netcat \
        nmap \
        ntp \
        open-iscsi \
        python-pip \
        python-yaml \
        rsync \
        rsyslog \
        screen \
        shunit2 \
        socat \
        sudo \
        sysstat \
        tar \
        tcpdump \
        tmux \
        traceroute \
        uuid-runtime \
        vim \
        wget \
        chrpath \
        nasm \
        unzip \
        xz \
        puppet \
        git \
        git-review \
        perl-XML-XPath \
        jq \
        autoconf \
        automake \
        bison \
        ccache \
        cscope \
        debhelper \
        ed \
        gettext \
        indent \
        lcov \
        libapr1 \
        libtool \
        m4 \
        pkg-config \
        python-virtualenv \
        libopenssl-devel \
        && zypper --non-interactive clean


RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    python-devel \
    python-virtualenv \
    python-setuptools \
    python-pip \
    python-wheel \
    libmysqlclient-devel \
    kernel-devel \
    valgrind \
    doxygen graphviz python-jinja2 asciidoc dblatex \
    source-highlight python-sphinx libxml2 libffi-devel python-cffi \
    python-pyparsing libstdc++6 python-sphinx_rtd_theme \
    glibc-devel-static \
    java-1_8_0-openjdk-devel \
    yum-utils \
    openssl \
    indent \
    python-devel \
    python-virtualenv \
    python-setuptools \
    python-pip \
    python-wheel \
    kernel-devel \
    doxygen \
    graphviz \
    python-jinja2 \
    asciidoc \
    dblatex \
    source-highlight \
    libxml2 \
    libffi-devel \
    python-cffi \
    python-pyparsing \
    libstdc++6 \
    python-sphinx_rtd_theme \
    cpp \
    gcc \
    gcc-c++ \
    cmake \
    make \
    lcov \
    libconfuse-devel \
    python-mock \
    rrdtool \
    rrdtool-devel \
    libapr1 \
    libapr1-devel \
    libexpat-devel \
    pcre-devel \
    curl \
    git-review \
    ctags \
    cscope \
    libxml2-tools \
    unzip \
    lsb-release \
    devscripts \
    libpcap-devel \
    libcap-devel \
    iproute2 \
    ethtool \
    vlan \
    bridge-utils \
    vim \
    gdb  \
    gdbserver \
    libxml2-devel \
    libxslt-devel \
    ruby-devel \
    zlib-devel \
    && zypper --non-interactive clean

RUN zypper --non-interactive update && \
    zypper --non-interactive install -t pattern devel_basis \
    && zypper --non-interactive clean


RUN mkdir /workspace && mkdir -p /var/ccache && ln -s /var/ccache /tmp/ccache
ENV CCACHE_DIR=/var/ccache
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

RUN gem install package_cloud
