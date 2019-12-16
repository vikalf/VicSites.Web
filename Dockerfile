FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR .
COPY ["src/VicSites.Web/VicSites.Web.csproj", "src/VicSites.Web/"]
RUN dotnet restore "src/VicSites.Web/VicSites.Web.csproj"
COPY . .
WORKDIR "/src/VicSites.Web"
RUN dotnet build "VicSites.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "VicSites.Web.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "VicSites.Web.dll"]