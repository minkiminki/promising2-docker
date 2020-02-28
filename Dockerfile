FROM coqorg/coq:8.9.1
MAINTAINER Minki Cho <minki.cho@sf.snu.ac.kr>

#WORKDIR /root

RUN eval `opam config env` && \
  opam repo add coq-released https://coq.inria.fr/opam/released && \
  opam remote add coq-promising -k git https://github.com/snu-sf/promising-opam-coq-archive && \
  opam remote add coq-weakmemory-local -k git https://github.com/weakmemory/local-coq-opam-archive && \
  opam install -y coq-paco.2.0.3 coq-sflib coq-promising-lib coq-promising2 coq-imm && \
  git clone https://github.com/snu-sf/promising2-coq.git && \
  cd promising2-coq && \
  make build -j && \
  cd .. && \
  git clone https://github.com/weakmemory/promising2ToImm.git && \
  cd promising2ToImm && \
  make build -j

#CMD bash