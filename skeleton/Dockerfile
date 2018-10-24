FROM  library/node:8-alpine AS builder

ADD package*.json ./src/

RUN npm install --prefix src

ADD  . ./src/

WORKDIR ./src

# TODO Uncomment when all lint errors will be fixed
RUN npm run lint --no-fix

# TODO Publish test results
RUN npm run test
RUN npm run build

# Start of runtime image
FROM library/nginx:1.13.9

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

COPY --from=builder ./src/dist .

ADD start_container.sh .

RUN chmod +x start_container.sh

EXPOSE 80

CMD ./start_container.sh