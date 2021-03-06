#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine AS build
WORKDIR /app
COPY "SimpleRoutingProgram.csproj" .
# from https://github.com/google/or-tools/releases/download/v9.0/or-tools_alpine-edge_v9.0.9048.tar.gz
COPY "packages" packages
RUN dotnet restore "SimpleRoutingProgram.csproj"

COPY . .
RUN dotnet build "SimpleRoutingProgram.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SimpleRoutingProgram.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine AS final
WORKDIR /app
EXPOSE 80
COPY --from=publish /app/publish .
ENTRYPOINT ["./Google.OrTools.SimpleRoutingProgram"]
