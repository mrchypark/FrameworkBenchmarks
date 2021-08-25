FROM rstudio/plumber:v1.0.0

COPY plumber.R /app/plumber.R

CMD ["/app/plumber.R"]