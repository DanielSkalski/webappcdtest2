FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

COPY WebAppCdTest2/*.csproj ./webapp/
WORKDIR /app/webapp
RUN dotnet restore

WORKDIR /app/
COPY WebAppCdTest2/. ./webapp/
WORKDIR /app/webapp
RUN dotnet publish -c Release -o out

# FROM build-env AS testrunner
# WORKDIR /app/Tests
# COPY Tests/. .
# ENTRYPOINT [ "dotnet", "test", "--logger:trx" ]

FROM microsoft/dotnet:aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/webapp/out ./
ENTRYPOINT ["dotnet", "WebAppCdTest2.dll"]