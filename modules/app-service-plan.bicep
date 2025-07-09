param location string 

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'mg-bicep-app-service-plan'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
output appServicePlanId string = appServicePlan.id
