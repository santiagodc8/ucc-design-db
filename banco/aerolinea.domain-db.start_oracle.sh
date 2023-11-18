docker run --name oracle \
        -p 1521:1521 \
        -e ORACLE_PASSWORD=oracle \
        -e APP_USER=AEROLINEA \
        -e APP_USER_PASSWORD=oracle \
        -d gvenzl/oracle-xe


        