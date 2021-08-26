FROM ghcr.io/mrchypark/fiery:1.1.3

COPY run.R run.R

CMD [ "Rscript", "run.R"]