param location string 
param appServicePlanId string

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'mg-web-app'
  location: location
  properties: {
    serverFarmId: appServicePlanId
  }
}