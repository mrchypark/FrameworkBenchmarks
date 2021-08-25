FROM rexyai/restrserve:0.4.1-minimal

COPY main.R main.R

ENV R_ENABLE_JIT=0 

CMD ["Rscript", "main.R"]