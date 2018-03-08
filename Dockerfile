FROM opensuse:42.3
MAINTAINER Ed Kern <ejk@cisco.com>
LABEL Description="VPP opensuse baseline"
LABEL Vendor="cisco.com"
LABEL Version="1.0"


# Setup the environment
ENV DEBIAN_FRONTEND=noninteractive


#RUN zypper clean -a && \
#    zypper --non-interactive --gpg-auto-import-keys ar http://download.opensuse.org/update/leap/42.3/oss/openSUSE:Leap:42.3:Update.repo && \
#    zypper --gpg-auto-import-keys ref && \
#    zypper --non-interactive --gpg-auto-import-keys ar http://download.opensuse.org/repositories/Cloud:/Tools/openSUSE_Leap_42.3/ Cloud:Tools.repo


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
        unzip \
        zip \
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

RUN zypper install -y https://download.opensuse.org/tumbleweed/repo/oss/suse/x86_64/nasm-2.13.02-1.1.x86_64.rpm

#python resources and libraries
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    python-devel \
    python-setuptools \
    python-pip \
    python-wheel \
    python-mock \
    python3-devel \
    python3-pip \
    python-rpm-macros \
    shadow \
    libnuma-devel \
    && zypper --non-interactive clean

#documentation packages
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    doxygen \
    graphviz \
    asciidoc \
    dblatex \
    source-highlight \
    python-sphinx \
    libxml2 \
    python-jinja2 \
    python-cffi \
    python-pyparsing \
    python-sphinx_rtd_theme \
    && zypper --non-interactive clean
    
#compilation packages
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    cpp \
    gcc \
    gcc-c++ \
    cmake \
    make \
    gcc6 \
    libstdc++-devel \
    ruby-devel \
    && zypper --non-interactive clean

#debugging    
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    valgrind \
    rrdtool \
    rrdtool-devel \
    autoconf \
    automake \
    ccache \
    chrpath \
    && zypper --non-interactive clean

#misc tool
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    openssl \
    emacs \
    curl \
    git \
    git-review \
    unzip \
    devscripts \
    iproute2 \
    ethtool \
    vlan \
    bridge-utils \
    vim \
    gdb \
    gdbserver \
    lsb-release \
    distribution-release \
    && zypper --non-interactive clean

#tldk   
RUN zypper --non-interactive update && \
    zypper --non-interactive install \
    libpcap-devel \
    libcap-devel \
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
    libclang \
    llvm-clang \
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
    check-devel \
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
    rpm-build \
    boost_1_61-devel \
    mbedtls-devel \
    && zypper --non-interactive clean

RUN zypper --non-interactive update && \
    zypper --non-interactive install -t pattern devel_basis \
    && zypper --non-interactive clean



RUN mkdir /workspace && mkdir -p /var/ccache && ln -s /var/ccache /tmp/ccache
ENV CCACHE_DIR=/var/ccache
ENV CCACHE_READONLY=true
ENV MAKE_PARALLEL_FLAGS -j 4
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'

#RUN gem install rake

RUN gem install package_cloud
