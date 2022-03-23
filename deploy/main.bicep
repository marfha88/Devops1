param location string = resourceGroup().location

@allowed([
  'nonprod'
  'prod'
])
param enviromentType string

@description('The name of the App Service app. This name must be globally unique.')
param appServiceAppName string = 'toyweb-${uniqueString(resourceGroup().id)}'

module appService 'modules/app-service.bicep' = {
  name: 'app-service'
  params: {
    location: location
    environmentType: enviromentType
    appServiceAppName: appServiceAppName
  }
}

