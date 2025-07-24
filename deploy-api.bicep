param sites_uc_ae_tst_classallo_proc_fa_name string = 'uc-ae-tst-classallo-proc-fa'
param serverfarms_uc_ae_tst_intcore_fa_asp_01_externalid string = '/subscriptions/2bf6028e-9083-42ec-8a93-7df414076348/resourceGroups/uc-ae-int-tst-intcore-rg/providers/Microsoft.Web/serverfarms/uc-ae-tst-intcore-fa-asp-01'

resource sites_uc_ae_tst_classallo_proc_fa_name_resource 'Microsoft.Web/sites@2024-11-01' = {
  name: sites_uc_ae_tst_classallo_proc_fa_name
  location: 'Australia East'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/2bf6028e-9083-42ec-8a93-7df414076348/resourceGroups/uc-ae-tst-classallo-proc-rg/providers/microsoft.insights/components/uc-ae-tst-classallo-proc-appi'
  }
  kind: 'functionapp,linux'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_uc_ae_tst_classallo_proc_fa_name}.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_uc_ae_tst_classallo_proc_fa_name}.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_uc_ae_tst_intcore_fa_asp_01_externalid
    reserved: true
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    outboundVnetRouting: {
      allTraffic: false
      applicationTraffic: false
      contentShareTraffic: false
      imagePullTraffic: false
      backupRestoreTraffic: false
    }
    siteConfig: {
      numberOfWorkers: 1
      linuxFxVersion: 'DOTNET-ISOLATED|8.0'
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 3
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientAffinityProxyEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    customDomainVerificationId: 'E16B842EA18EC809AD2160DA58EDF33F32521CF9834F9D068AEC0C242C9E2FA6'
    containerSize: 1536
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    keyVaultReferenceIdentity: 'SystemAssigned'
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'ftp'
  location: 'Australia East'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/2bf6028e-9083-42ec-8a93-7df414076348/resourceGroups/uc-ae-tst-classallo-proc-rg/providers/microsoft.insights/components/uc-ae-tst-classallo-proc-appi'
  }
  properties: {
    allow: true
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'scm'
  location: 'Australia East'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/2bf6028e-9083-42ec-8a93-7df414076348/resourceGroups/uc-ae-tst-classallo-proc-rg/providers/microsoft.insights/components/uc-ae-tst-classallo-proc-appi'
  }
  properties: {
    allow: true
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_web 'Microsoft.Web/sites/config@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'web'
  location: 'Australia East'
  tags: {
    'hidden-link: /app-insights-resource-id': '/subscriptions/2bf6028e-9083-42ec-8a93-7df414076348/resourceGroups/uc-ae-tst-classallo-proc-rg/providers/microsoft.insights/components/uc-ae-tst-classallo-proc-appi'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
    ]
    netFrameworkVersion: 'v4.0'
    linuxFxVersion: 'DOTNET-ISOLATED|8.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$uc-ae-tst-classallo-proc-fa'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetRouteAllEnabled: false
    vnetPrivatePortsCount: 2
    cors: {
      allowedOrigins: [
        'https://portal.azure.com'
      ]
      supportCredentials: true
    }
    localMySqlEnabled: false
    managedServiceIdentityId: 9988
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    functionAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 3
    azureStorageAccounts: {}
    http20ProxyFlag: 0
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_030f9778_38dc_4c65_842a_ff27fc551df8 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '030f9778-38dc-4c65-842a-ff27fc551df8'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"4136f89329f30a91b945b0c1feca921092cd8d72","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2024-12-11T00:10:03.7808408Z'
    end_time: '2024-12-11T00:10:04.7208441Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_04fb7ac8_69ec_400d_b603_c8e44ee20426 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '04fb7ac8-69ec-400d-b603-c8e44ee20426'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"7a4000832268106252e211d77bb4bb5b15e59d04","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2025-04-02T04:26:39.050019Z'
    end_time: '2025-04-02T04:26:40.0803052Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_1eb3274c_038b_431c_b7dc_e569bced0c3a 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '1eb3274c-038b-431c-b7dc-e569bced0c3a'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"a730194af94a934ecf4cf1c75deac2bd236774d6","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2024-09-26T03:16:29.9053859Z'
    end_time: '2024-09-26T03:16:30.8826315Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_225563f9_04f4_41f1_99f1_ba3a3855e429 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '225563f9-04f4-41f1-99f1-ba3a3855e429'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"23df2197e4c27a935ff00334d450aed454435d02","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2025-03-20T06:38:36.9997428Z'
    end_time: '2025-03-20T06:38:38.0030057Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_2a3a44d5_cc70_4be6_a674_e51c395648b4 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '2a3a44d5-cc70-4be6-a674-e51c395648b4'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"c719ad2899c91309d67669bdf0ac423eaf787435","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2024-12-11T02:44:05.5173909Z'
    end_time: '2024-12-11T02:44:06.4388011Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_3a06c9ad_60fe_4163_b5f2_8688b2345ba5 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '3a06c9ad-60fe-4163-b5f2-8688b2345ba5'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"017cb9db34d315893f5838340dc4c9afcd2d1bf8","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2024-09-24T01:13:06.6701933Z'
    end_time: '2024-09-24T01:13:07.6068906Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_4063e84a_7efa_4a7d_99d7_423635440014 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '4063e84a-7efa-4a7d-99d7-423635440014'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"b86d398e06a5532c7860fa14d27c0e29be988129","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"MGKYAING101","slotName":"production"}'
    start_time: '2025-07-23T02:56:53.8990383Z'
    end_time: '2025-07-23T02:56:54.9813843Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_e86ca3bb_617d_4361_bc14_c19e0dccb8d5 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'e86ca3bb-617d-4361-bc14-c19e0dccb8d5'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"a807c9027e70cdb906e367a5de27724c36d88118","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"MGKYAING101","slotName":"production"}'
    start_time: '2025-07-23T05:52:04.4973795Z'
    end_time: '2025-07-23T05:52:05.5534914Z'
    active: true
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_f5ae3f6f_8f9c_43fe_82e2_45fb0d07f73d 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'f5ae3f6f-8f9c-43fe-82e2-45fb0d07f73d'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"750070a8a2299c6ff4cac49d3395199cc60074d0","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2025-03-28T03:25:54.5704067Z'
    end_time: '2025-03-28T03:25:55.4267413Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_f88402ae_67ac_41d2_9c64_b40d66542077 'Microsoft.Web/sites/deployments@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'f88402ae-67ac-41d2-9c64-b40d66542077'
  location: 'Australia East'
  properties: {
    status: 4
    author_email: 'N/A'
    author: 'N/A'
    deployer: 'GITHUB_ZIP_DEPLOY_FUNCTIONS_V1'
    message: '{"type":"deployment","sha":"99ba3f344cf5a9e7defd723ff2bfae1b1f4e7abc","repoName":"UNSWCollegeIT/integration-classallocation-processes","actor":"YeHUNSWC","slotName":"production"}'
    start_time: '2024-12-12T03:22:14.719036Z'
    end_time: '2024-12-12T03:22:15.8002187Z'
    active: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_AemDegreeManagerFunction 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'AemDegreeManagerFunction'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/AemDegreeManagerFunction.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/AemDegreeManagerFunction'
    config: {
      name: 'AemDegreeManagerFunction'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.AemDegreeManagerFunction.Run'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'myTimer'
          type: 'timerTrigger'
          direction: 'In'
          schedule: '%aem_interval%'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_CatgmemInfoTimeTrigger 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'CatgmemInfoTimeTrigger'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/CatgmemInfoTimeTrigger.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/CatgmemInfoTimeTrigger'
    config: {
      name: 'CatgmemInfoTimeTrigger'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.CatgmemInfoTimeTrigger.RunAsync'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'myTimer'
          type: 'timerTrigger'
          direction: 'In'
          schedule: '%intervalforCategoryTimeTriggers%'
        }
        {
          name: 'CatgmemresultSet'
          type: 'sql'
          direction: 'In'
          commandText: '%vw_Allocate_MaterImport_Course%'
          connectionStringSetting: 'sql_Connection'
        }
        {
          name: 'blobContent'
          type: 'blob'
          direction: 'In'
          properties: {
            supportsDeferredBinding: 'True'
          }
          blobPath: '%mappingexceptionContainer%/%exceptionmappingfile%'
          connection: 'classallofilestrConnection'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_CourseInfoTimeTrigger 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'CourseInfoTimeTrigger'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/CourseInfoTimeTrigger.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/CourseInfoTimeTrigger'
    config: {
      name: 'CourseInfoTimeTrigger'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.CourseInfoTimeTrigger.RunAsync'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'CourseInfoTimer'
          type: 'timerTrigger'
          direction: 'In'
          schedule: '%intervalforCoursesTimeTriggers%'
        }
        {
          name: 'CourseresultSet'
          type: 'sql'
          direction: 'In'
          commandText: '%vw_Allocate_MaterImport_Course%'
          connectionStringSetting: 'sql_Connection'
        }
        {
          name: 'blobContent'
          type: 'blob'
          direction: 'In'
          properties: {
            supportsDeferredBinding: 'True'
          }
          blobPath: '%mappingexceptionContainer%/%exceptionmappingfile%'
          connection: 'classallofilestrConnection'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_FetchPhotoReadyStudentTimerTrigger 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'FetchPhotoReadyStudentTimerTrigger'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/FetchPhotoReadyStudentTimerTrigger.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/FetchPhotoReadyStudentTimerTrigger'
    config: {
      name: 'FetchPhotoReadyStudentTimerTrigger'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.FetchPhotoReadyStudentTimerTrigger.RunAsync'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'fetchPhotoReadyStudentTimer'
          type: 'timerTrigger'
          direction: 'In'
          schedule: '%intervalforFetchPartyImageTimeTrigger%'
        }
        {
          name: 'studentPhotos'
          type: 'sql'
          direction: 'In'
          commandText: '%sp_get_ready_students_partyid_zid%'
          connectionStringSetting: 'sql_Connection'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_JdrExtractTransfer 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'JdrExtractTransfer'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/JdrExtractTransfer.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/JdrExtractTransfer'
    config: {
      name: 'JdrExtractTransfer'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.JdrExtractTransfer.Run'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'stream'
          type: 'blobTrigger'
          direction: 'In'
          properties: {
            supportsDeferredBinding: 'True'
          }
          path: 'jdr-exports/{name}'
          connection: 'classallofilestrConnection'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_StudentInfoTimeTrigger 'Microsoft.Web/sites/functions@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: 'StudentInfoTimeTrigger'
  location: 'Australia East'
  properties: {
    script_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/site/wwwroot/UNSWC.MOODLE.AzureFunctions.dll'
    test_data_href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/vfs/home/data/Functions/sampledata/StudentInfoTimeTrigger.dat'
    href: 'https://uc-ae-tst-classallo-proc-fa.azurewebsites.net/admin/functions/StudentInfoTimeTrigger'
    config: {
      name: 'StudentInfoTimeTrigger'
      entryPoint: 'UNSWC.MOODLE.AzureFunctions.StudentInfoTimeTrigger.RunAsync'
      scriptFile: 'UNSWC.MOODLE.AzureFunctions.dll'
      language: 'dotnet-isolated'
      functionDirectory: ''
      bindings: [
        {
          name: 'myTimer'
          type: 'timerTrigger'
          direction: 'In'
          schedule: '%intervalforStudentTimeTriggers%'
        }
        {
          name: 'studentResultSet'
          type: 'sql'
          direction: 'In'
          commandText: '%vw_allocate_masterimport_student_enrollment%'
          connectionStringSetting: 'sql_Connection'
        }
        {
          name: 'blobContent'
          type: 'blob'
          direction: 'In'
          properties: {
            supportsDeferredBinding: 'True'
          }
          blobPath: '%mappingexceptionContainer%/%exceptionmappingfile%'
          connection: 'classallofilestrConnection'
        }
      ]
    }
    language: 'dotnet-isolated'
    isDisabled: false
  }
}

resource sites_uc_ae_tst_classallo_proc_fa_name_sites_uc_ae_tst_classallo_proc_fa_name_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-11-01' = {
  parent: sites_uc_ae_tst_classallo_proc_fa_name_resource
  name: '${sites_uc_ae_tst_classallo_proc_fa_name}.azurewebsites.net'
  location: 'Australia East'
  properties: {
    siteName: 'uc-ae-tst-classallo-proc-fa'
    hostNameType: 'Verified'
  }
}
