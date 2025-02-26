<!DOCTYPE html>
<html style="font-size: .625em">
	<head>
		<title>betclic.fr - FR</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
	</head>
	<body>
		<style type='text/css'>
			/* @font-face{
				font-family: Metropolis;
				font-display: auto;
				src:url("https://www.betclic.pl/fonts/metropolis-black.woff2") format("woff2"),
					url("https://www.betclic.pl/fonts/metropolis-black.woff") format("woff")
			} */
				/*@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 300;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Light.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Light.woff") format("woff")
				}
				@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 400;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Regular.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Regular.woff") format("woff")
				}
				@font-face{
					font-family: Metropolis;
					font-display: auto;
					font-style: normal;
					font-weight: 700;
					src:url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF2/Metropolis-Bold.woff2") format("woff2"),
						url("https://betclicgroup--sbapr2023.sandbox.my.salesforce-sites.com/resource/MetropolisFont/WOFF/Metropolis-Bold.woff") format("woff")
				}*/

			/* There is used Betclic color #d2161e */
			.embeddedServiceHelpButton .helpButton .uiButton {
				background-color: #d2161e;
				font-family: "Arial", sans-serif;
			}
			.embeddedServiceHelpButton .helpButton .uiButton:focus {
				outline: 1px solid #d2161e;
			}
		</style>
        <script type='text/javascript' src='https://betclicgroup--sept2024vm.sandbox.my.site.com/ESWMessagingforWeb1736881213811/assets/js/bootstrap.min.js' onload='initEmbeddedMessaging()'></script>
		<script type='text/javascript'>
			function initEmbeddedMessaging() {
            debugger;
				try {
                /*
                French = 'fr'
                English = 'en'
                Polish = 'pl'
                Portuguese (European) = 'pt-PT'
                */
                // Chat info
                let language = 'en';
               
                // Hidden Pre-chat form details
                let siteCode = 'frfr';
                let sourceUid = 'Cl1234';
                let applicationId = 'BETCLICFR';
                let segment = 'Some segment';
                let chatSource = 'BetclicFr';
                let appVersion = 'Some app version';
                let hasGoogleMobileServices = 'No'; // 'Yes' or 'No'
                let isLoggedIn = 'No'; // 'Yes' or 'No'
                
                //Pre-chat form fields
                let username = '';
                
                window.addEventListener("onEmbeddedMessagingReady", () => {
                    console.log("Received the onEmbeddedMessagingReady event�");
                
                    // Send data to Salesforce
                    // set visible prechat field
                    embeddedservice_bootstrap.prechatAPI.setVisiblePrechatFields({
                        // List the pre-chat field names with the value and whether
                        // it's editable in the pre-chat form.
                        "username": {
                          "value": username,
                          "isEditableByEndUser": true
                        }
                    });
                    
                    //Set invisible prechat field
                    embeddedservice_bootstrap.prechatAPI.setHiddenPrechatFields({
                        "siteCode" : siteCode,
                        "applicationId" : applicationId,
                        "segment" : segment,
                        "chatSource" : chatSource,
                        "appVersion" : appVersion,
                        "hasGoogleMobileServices" : hasGoogleMobileServices,
                        "isLoggedIn" : isLoggedIn
                    });
                });
                
                window.addEventListener("onEmbeddedMessagingPreChatSubmitted", (e) => {
                    console.log('onEmbeddedMessagingPreChatSubmitted');
                    console.log(JSON.parse(JSON.stringify(e)));
                });

                embeddedservice_bootstrap.settings.language = language; // For example, enter 'en' or 'en-US'
                debugger;
                embeddedservice_bootstrap.init(
                    '00DAa000009woNe',
                    'Messaging_for_Web',
                    'https://betclicgroup--sept2024vm.sandbox.my.site.com/ESWMessagingforWeb1736881213811',
                    {
                        scrt2URL: 'https://betclicgroup--sept2024vm.sandbox.my.salesforce-scrt.com'
                    }
                );
				} catch (err) {
					console.error('Error loading Embedded Messaging: ', err);
				}
			};
		</script>
        <input type="button" value="Start Chat" onclick="startChat();"/><br/><br/>
	</body>
</html>
