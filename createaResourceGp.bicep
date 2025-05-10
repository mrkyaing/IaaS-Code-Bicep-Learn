targetScope = 'subscription'

resource MGRGBicep 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'MGRGBicep'
  location: 'Central India'
  tags: {
    environment: 'dev'
  }
}