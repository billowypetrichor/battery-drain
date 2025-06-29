FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /source

COPY *.sln .
COPY src/*.csproj ./src/
RUN dotnet restore

COPY src/. ./src/
WORKDIR /source/src
RUN dotnet build --configuration Release --no-restore && \
    dotnet publish --configuration Release --output /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS runtime
WORKDIR /app

COPY --from=build /app ./

RUN addgroup --system draingroup && adduser --system --ingroup draingroup drainuser && \
    chown -R drainuser:draingroup /app && \
    setcap 'cap_net_bind_service=+ep' /usr/bin/dotnet

USER drainuser

VOLUME /app/logs

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:5000/health || exit 1

ENTRYPOINT ["dotnet", "DotNetHelloWorld.dll"]

