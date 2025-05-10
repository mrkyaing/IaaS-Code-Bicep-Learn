resource azmgappserviceplanx 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: 'azmgappserviceplanx'
  location: 'Central India'
  kind:'linux'
  sku: {
    name: 'S1'
    tier: 'Standard'
    capacity: 1
  }
  properties: {
    name: 'azmgappserviceplanx'
    workerSize: 0
    numberOfWorkers: 1
    hostingEnvironmentProfile: null
     reserved:true
  }
}