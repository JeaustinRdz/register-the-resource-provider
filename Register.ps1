# Import the Az module if not already imported
Import-Module Az

# Connect to your Azure account 
Connect-AzAccount

# Specify the resource provider namespace and the feature name to register
$resourceProviderNamespace = "Microsoft.Sovereign"
$featureName = "LandingZoneAccount"
$subscriptionId = "your-subscription-id"
Set-AzContext -SubscriptionId $subscriptionId

# Register the feature for the subscription if it's not registered yet.
# The feature must be registered specifically for the subscription ID for you to be able to use it.
Register-AzProviderFeature -FeatureName $featureName -ProviderNamespace $resourceProviderNamespace
# In this case specifically:
Register-AzProviderFeature -FeatureName "LandingZoneAccount" -ProviderNamespace "Microsoft.Sovereign"

# Verify the registration status for the feature
Get-AzProviderFeature -ProviderNamespace $resourceProviderNamespace -FeatureName $featureName

# Register the resource provider
Register-AzResourceProvider -ProviderNamespace $resourceProviderNamespace

# Verify the registration status for resource provider
Get-AzResourceProvider -ProviderNamespace $resourceProviderNamespace

# Note: Sometimes there may be a delay for the registration to fully sync across services.
# If you're able to use the feature and it’s working as expected, the registration might already be complete.
