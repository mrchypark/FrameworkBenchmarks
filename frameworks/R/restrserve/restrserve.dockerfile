FROM rexyai/restrserve:0.4.1-minimal

COPY run.R run.R

ENV R_ENABLE_JIT=0 

CMD ["Rscript", "run.R"]