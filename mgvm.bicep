resource vm_myvm 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: 'mg-vm'
  location: 'Central India'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ls'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        name: 'myosdisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    osProfile: {
      computerName: 'mgvm'
      adminUsername: 'azureuser'
      adminPassword: 'Password123!'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resourceId('Microsoft.Network/networkInterfaces', 'my-nic')
        }
      ]
    }
  }
}