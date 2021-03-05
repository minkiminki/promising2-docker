FROM coqorg/coq:8.9.1
MAINTAINER Minki Cho <minki.cho@sf.snu.ac.kr>

#WORKDIR /root

RUN eval `opam config env` && \
  opam repo add coq-released https://coq.inria.fr/opam/released && \
  opam remote add coq-promising -k git https://github.com/snu-sf/promising-opam-coq-archive && \
  opam install -y coq-paco.2.0.3 coq-sflib coq-promising-lib && \
  git clone https://github.com/snu-sf/promising-ldrf-coq.git && \
  cd promising-ldrf-coq && \
  make build -j

#CMD bash