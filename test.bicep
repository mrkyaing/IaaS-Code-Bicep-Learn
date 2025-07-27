@description('storage account location')
param location string = 'west europe' 
output helloWorld string = 'Hello World'
resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: 'toy-product-launch-plan'
  location: location
  sku: {
    name: 'F1'
  }
}
