FROM scratch

COPY fx /bin/fx

WORKDIR /data

ENV COLORTERM=truecolor

ENTRYPOINT ["/bin/fx"]
