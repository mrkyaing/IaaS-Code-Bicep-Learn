@description('The name of the App Service app. This name must be globally unique.')
param appServiceAppName string = 'toyweb-${uniqueString(resourceGroup().id)}'
@description('The name of the App Service app. This name must be globally unique.')
param location string = resourceGroup().location
@description('The environment type for the App Service (e.g., "Production", "Staging").')
param environmentType string = 'Production'
@description('The name of the Cosmos DB account. This name must be globally unique.')
param cosmosDBAccountName string = 'toyweb-${uniqueString(resourceGroup().id)}'
module appService 'modules/app-service.bicep' = {
  name: 'app-service'
  params: {
    location: location
    environmentType: environmentType
    appServiceAppName: appServiceAppName
  }
}
module cosmosDB 'modules/cosmos-db.bicep' = {
  name: 'cosmos-db'
  params: {
    location: location
    environmentType: environmentType
    cosmosDBAccountName: cosmosDBAccountName
  }
}
