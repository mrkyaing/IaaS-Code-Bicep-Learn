param location string 
targetScope ='subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'bicep-web-app-rg'
  location: location
}

module appServicePlan './modules/app-service-plan.bicep' = {
  scope: resourceGroup
  name: 'appServicePlan'
  params: {
    location: resourceGroup.location
  }
}

module webApp './modules/web-app.bicep' = {
  scope: resourceGroup
  name: 'webApp'
  params: {
    location: resourceGroup.location
    appServicePlanId: appServicePlan.outputs.appServicePlanId
  }
}
