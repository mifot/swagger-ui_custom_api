FROM swaggerapi/swagger-ui

ENV PORT 8080
ENV SWAGGER_YAML "swagger.yaml"

RUN rm -f /usr/share/nginx/run.sh 

# COPY ./api/* /usr/share/nginx/html/api

VOLUME ./api /usr/share/nginx/html/api

COPY ./run.sh /usr/share/nginx/

RUN chmod +x /usr/share/nginx/run.sh 

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/run.sh"]