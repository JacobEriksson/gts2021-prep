FROM alpine:3.10

RUN apk add --no-cache --update nodejs npm \
    git  python3 python3-dev gcc g++ unixodbc-dev
RUN pip3 install --upgrade pip
RUN pip3 install boto3 sqlalchemy_pyodbc_mssql

RUN mkdir /code
WORKDIR /code
COPY set_privileges.sql /code/set_privileges.sql

# Copy the starting app
COPY runapp.sh /code
RUN chmod +x /code/runapp.sh

# Start the application
ENTRYPOINT [ "/code/runapp.sh"]
EXPOSE 3001 3000