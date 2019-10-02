FROM nnurphy/deb

ENV RACKET_HOME=/opt/racket RACKET_VERSION=7.4
ENV PATH=${RACKET_HOME}/bin:$PATH
ARG rkt_url=https://mirror.racket-lang.org/installers/${RACKET_VERSION}/racket-minimal-${RACKET_VERSION}-x86_64-linux.sh

RUN set -ex \
#  ; apt-get install -y --no-install-recommends \
#      libcairo2 libpango-1.0-0 libpangocairo-1.0 \
#  ; apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \
#  #; wget -q -O- $url | sh -s -- --in-place --dest ${RACKET_HOME} \
  ; wget -q -O racket.sh ${rkt_url} \
  ; sh ./racket.sh --in-place --dest ${RACKET_HOME} \
  ; rm ./racket.sh \
  ; raco pkg install rash \
#  ; raco pkg install --auto iracket \
#  ; racket -l iracket/install \
  ; rm -rf ${HOME}/.racket/download-cache

CMD [ "racket", "-l", "rash/repl", "--" ]