FROM swaggerapi/swagger-ui

ENV API_KEY "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 8080
ENV BASE_URL ""
ENV SWAGGER_JSON_URL ""
ENV SWAGGER_YAML "swagger.yaml"

RUN rm -f /usr/share/nginx/run.sh 

COPY ./api/* /usr/share/nginx/html/

COPY ./run.sh /usr/share/nginx/

RUN chmod +x /usr/share/nginx/run.sh 

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/run.sh"]