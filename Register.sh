# Ensure you are logged into the proper tenant
# If you have a custom domain for your tenant, replace yourtenant.onmicrosoft.com 
# with your custom domain you used for your Entra ID tenant.
az login --tenant yourtenant.onmicrosoft.com
# Set variables for the resource provider activation
resourceProviderNamespace="Microsoft.Sovereign"
featureName="LandingZoneAccount"
subscriptionId="your-subscription-id"
az account set --subscription $subscriptionId

# Next register the feature, then (re-)register the provider to activate the feature
az feature register --namespace "$resourceProviderNamespace" --name "$featureName"
az provider register --namespace "$resourceProviderNamespace"

# Finally, check your registration status. It can take up to 15min for the registration to complete.
# The field registrationState should show the value 'Registered' if it succeeeded.
az provider show --name "$resourceProviderNamespace"

# You can also check if the feature LandingZoneAccount exists under the Microsoft.Sovereign namespace for a specific subscription ID
az feature list --namespace Microsoft.Sovereign --query "[?contains(name, 'LandingZoneAccount')]" --subscription <your-subscription-id>
