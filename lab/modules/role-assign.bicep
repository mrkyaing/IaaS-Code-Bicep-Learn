@description('id for principle id')
param principalId string
@description('role definition id of')
param roleDefinitionId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2023-04-01-preview' = {
  name: guid(principalId, roleDefinitionId, resourceGroup().id)
  properties: {
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    description: 'The deployment pipeline for the company\'s website needs to be able to create resources within the resource group.'
  }
}
